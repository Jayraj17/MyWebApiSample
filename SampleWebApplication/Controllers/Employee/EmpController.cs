using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Http;

namespace SampleWebApplication.Controllers.Employee
{
    public class EmpController : Controller
    {
        // GET: Emp
        public ActionResult GetEmployee()
        {
            return View();
        }
        public ActionResult GetEmployee(EmpDTO objDTO)
        {
            var client = new HttpClient();
            if (objDTO.EmpName != null)
            {
                var response = client.PostAsJsonAsync("http://localhost:6198/api/EmpApi/GetEmpDetails", objDTO).Result;

                if (response.IsSuccessStatusCode)
                {
                }
            }
            return View();
        }

    }
}