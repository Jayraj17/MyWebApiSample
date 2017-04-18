﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmployeeMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        //public void GetStudentListData()
        //{
        //    DeveloperEntities db = new DeveloperEntities();
        //    var Data1 = db.Students.OrderBy(s => s.Name).ToList();
        //    if (Data1 != null)
        //    {
        //        ViewData["data"] = Data1;
        //    }

        //}
    }
}