using EmployeeMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmployeeMVC.Controllers
{
    public class EmployeeController : Controller
    {
        //
        // GET: /Employee/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ManageEmployee()
        {
            return View(EmpCls.GetEmployee());
        }
        public ActionResult AddEmployee(int EmpNo = 0)
        {
            GetEmployeeListData();
           // ViewBag.PCountryDD = Common.GetCountryMst();
           // ViewBag.PStateDD = Common.GetStateMst();
           // ViewBag.PCityDD = Common.GetCityMst();
            Employee obj = new Employee();
            if (EmpNo != 0)
            {
                obj = EmpCls.GetEmployee(EmpNo);
            }
            return View(obj);
        }
        [HttpPost]
        public ActionResult AddEmployee(Employee model)
        {
            if (ModelState.IsValid)
            {
                if (model.EmpNo == 0)
                {      
                     if (EmpCls.AddEmployee(model, model.EmpNo)==0)
                    {
                        ViewBag.Message = "Duplicate Name";
                        Employee obj = new Employee();
                        return View(obj);
                     }
                   
                }
                else
                {
                    if (EmpCls.UpdateEmployee(model,model.EmpNo) == 0)
                    {
                        ViewBag.Message = "Duplicate Name";
                        Employee obj = new Employee();
                        return View(obj);
                    }
                }
            }
            return RedirectToAction("ManageEmployee");
        }
        public ActionResult RemoveEmployee(int EmpNo = 0)
        {
            Boolean Del;
            EmpCls CObj = new EmpCls();
            Del = CObj.RemoveEmployee(EmpNo);
            if (Del == true)
            {
                return RedirectToAction("ManageEmployee");
            }
            else
            {
                return HttpNotFound();
            }
        }
        public void GetEmployeeListData()
        {
           
            DeveloperEntities db = new DeveloperEntities();
            var EmpData = db.Employees.Where(p => p.IsActive == 1).OrderBy(s => s.EmpName).ToList();
            if (EmpData != null)
            {
                ViewData["EmpData"] = EmpData;
            }

        }
	}
}