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
        public ActionResult SaveEmployee(EmpDTO objDTO, HttpPostedFileBase file)
        {


            #region FileUpload

            if (file == null)
            {
                ModelState.AddModelError("File", "Please Upload Your file");
            }
            else if (file.ContentLength > 0)
            {
                int MaxContentLength = 1024 * 1024 * 3; //3 MB
                string[] AllowedFileExtensions = new string[] { ".jpg", ".gif", ".png",".pdf" };
                if (!AllowedFileExtensions.Contains(file.FileName.Substring(file.FileName.LastIndexOf('.'))))
                {
                    ModelState.AddModelError("File", "Please file of type: " + string.Join(", ", AllowedFileExtensions));
                }
                else if (file.ContentLength > MaxContentLength)
                {
                    ModelState.AddModelError("File", "Your file is too large, maximum allowed size is: " + MaxContentLength + " MB");
                }
                else
                {
                    //TO:DO
                    string extension = Path.GetExtension(file.FileName);
                    string fileName = DateTime.Now.ToString("ddMMyyHHmmss").ToString() + extension;
                    var path1 = "~/Upload" + "/" + fileName;
                    file.SaveAs(Server.MapPath("~/Upload" + "//" + fileName));
                    ModelState.Clear();
                    ViewBag.Message = "File uploaded successfully";
                    objDTO.EmpFile = fileName;                   
                }
            }


            #endregion




            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://localhost:6198/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = client.PostAsJsonAsync("api/EmpApi/SaveEmployee/", objDTO).Result;
                if (!response.IsSuccessStatusCode)
                {
                    // Error Over Here....!!
                    return View("Error");
                }
                // var objtDTO = response.Content.ReadAsAsync<IEnumerable<EmpDTO>>().Result;
                return View();
            }
        }







    }
}