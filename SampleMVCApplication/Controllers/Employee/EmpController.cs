using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Http.Headers;
using System.IO;
using Newtonsoft.Json;

namespace SampleMVCApplication.Controllers.Employee
{
    public class EmpController : Controller
    {
        // GET: Emp
        public ActionResult SaveEmployee()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SaveEmployee(EmpDTO objDTO, List<HttpPostedFileBase> fileUpload)
        {


            #region FileUpload
            List<string> myTempPaths = new List<string>();
            ModelState.Clear();
            if (fileUpload.Count > 1)
            {
                int i = 0;
                var ErrorMessage = string.Empty;

                int cnts = 0;

                foreach (HttpPostedFileBase file in fileUpload)
                {

                    if (objDTO.DocDTO.DocName != null)
                    {
                        if (file != null && Array.Exists(objDTO.DocDTO.DocName.Split(','), s => s.Equals(file.FileName)))
                        {


                            int MaxContentLength = 1024 * 1024 * 3; //3 MB
                            string[] AllowedFileExtensions = new string[] { ".jpg", ".gif", ".png" };
                            if (!AllowedFileExtensions.Contains(file.FileName.Substring(file.FileName.LastIndexOf('.'))))
                            {
                                ModelState.AddModelError("File", "Please file of type: " + string.Join(", ", AllowedFileExtensions));

                                ErrorMessage = "Please upload Your File of type: " + string.Join(", ", AllowedFileExtensions);
                                // TempData["error"] = ("Please file of type: " + string.Join(", ", AllowedFileExtensions));
                                TempData["error"] = ErrorMessage;
                                return RedirectToAction("TicketsAdd");
                                // return ("TicketsEdit",TempData["error"].ToString());
                            }
                            else if (file.ContentLength > MaxContentLength)
                            {
                                ModelState.AddModelError("File", "Your file is too large, maximum allowed size is: " + MaxContentLength + " MB");

                                ErrorMessage = "Your file is too large, maximum allowed size is: " + MaxContentLength + " MB";
                                TempData["error"] = ErrorMessage;
                                return RedirectToAction("TicketsAdd");
                            }
                            else
                            {

                                string extension = Path.GetExtension(file.FileName);
                                var fileName = Path.GetFileName(file.FileName);
                                //  GetTicketAttachment(Convert.ToInt32(0));
                                /*  for (int l = 0; l < ViewBag.AllTicketAttachment.Count; l++)
                                  {
                                      if (ViewBag.AllTicketAttachment[l].FileName == fileName)
                                      {
                                          cnts++;                                      
                                      }                                   
                                  }*/
                                if (cnts > 0)
                                {
                                    ModelState.AddModelError("File", "Your file is already exist");
                                    ErrorMessage = "Your file is already exist";
                                    TempData["error"] = ErrorMessage;
                                    string url = this.Request.UrlReferrer.AbsolutePath;
                                    return Redirect(url);
                                }
                                else
                                {
                                    file.SaveAs(Path.Combine(Server.MapPath("~/Upload"), fileName));
                                    ModelState.Clear();
                                    myTempPaths.Add(fileName);
                                    i++;
                                }
                            }
                        }
                    }
                }
            }

            var count = myTempPaths.Count;
            #endregion




            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://localhost:6198/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = client.PostAsJsonAsync("api/EmpApi/SaveEmployee/", objDTO).Result;
                var test = Convert.ToString(response.ReasonPhrase);
                if (!response.IsSuccessStatusCode)
                {
                    // Error Over Here....!!
                    return View("Error");
                }




                for (int i = 0; i < count; i++)
                {                                

                    objDTO.DocDTO.DocName = myTempPaths[i];
                    objDTO.DocDTO.EmpNo = Convert.ToInt32(response.ReasonPhrase);
                    client.BaseAddress = new Uri("http://localhost:6198/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    HttpResponseMessage response1 = client.PostAsJsonAsync("api/EmpApi/AddDoc/", objDTO).Result;
                    if (response1.IsSuccessStatusCode)
                    {
                        //  .. cnt++;
                    }
                }


                // var objtDTO = response.Content.ReadAsAsync<IEnumerable<EmpDTO>>().Result;
                return View("SaveEmployee");
            }
        }


        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(EmpDTO obj)
        {
            try
            {
                var client = new HttpClient();

                var FillLogin = client.GetAsync("http://localhost:6198/api/EmpApi/GetEmp").Result
         .Content.ReadAsAsync<List<EmpDTO>>().Result.Where(item => item.UserName == obj.UserName && item.Password == obj.Password).SingleOrDefault();

                //var MyEmpDate = new EmpDTO
                //{
                //    UserName = FillLogin.UserName,
                //};           

                if (FillLogin == null)
                {
                    return RedirectToAction("Login", "Emp");
                }
                else
                {                 
                    return RedirectToAction("Index","Home");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }







    }
}