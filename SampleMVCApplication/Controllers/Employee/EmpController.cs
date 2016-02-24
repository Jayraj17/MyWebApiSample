using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Http.Headers;

namespace SampleMVCApplication.Controllers.Employee
{
    public class EmpController : Controller
    {
        // GET: Emp
        public ActionResult GetEmployee()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetEmployee(EmpDTO objDTO)
        {


            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://localhost:6198/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = client.GetAsync("api/EmpApi/GetAllByList/").Result;
                if (!response.IsSuccessStatusCode)
                {
                    // Error Over Here....!!
                    return View("Error");
                }
                // var objtDTO = response.Content.ReadAsAsync<IEnumerable<EmpDTO>>().Result;
                return View();
            }
        }


        public ActionResult SaveEmployee()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SaveEmployee(EmpDTO objDTO)
        {
            //if (ModelState.IsValid)
            //{
                using (var client = new HttpClient()) 
                {
                    client.BaseAddress = new Uri("http://localhost:6198/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    var response = client.PostAsJsonAsync("api/EmpApi/SaveEmployee", objDTO).Result;
                    if (response.IsSuccessStatusCode)
                    {
                    }

                }

           //}

            return RedirectToAction("GetEmployee");
        }




    }
}