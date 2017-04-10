using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace EmployeeMVC.Models
{
    public class EmployeeCls
    {
    }
    public class EmpCls
    {

        public static List<Employee> GetEmployee()
        {
            DeveloperEntities db = new DeveloperEntities();
            List<Employee> lst = db.Employees.OrderBy(P => P.EmpName).ToList();
            return lst;
        }

        public static Employee GetEmployee(int EmpNo)
        {
            DeveloperEntities db = new DeveloperEntities();
            Employee obj = db.Employees.Where(a => a.EmpNo == EmpNo).SingleOrDefault();
            return obj;
        }

        public static int AddEmployee(Employee model, int EmpNo = 0)
        {
            DeveloperEntities db = new DeveloperEntities();
            Employee obj = new Employee();
            bool IsExist = db.Employees.Any(R => R.EmpName == model.EmpName);
            if (IsExist == true)
            {
                return 0;
            }
            else
            {
                int maxid = db.Employees.Any() ? db.Employees.Max(s => s.EmpNo) : 0;
                //obj.EmpNo = maxid + 1;
                obj.EmpName = model.EmpName;
                obj.Salary = model.Salary;
                obj.DeptName = model.DeptName;
                obj.Designation = model.Designation;
                obj.EmpFile = model.EmpFile;
                obj.UserName = model.UserName;
                obj.Password = model.Password;
                obj.IsActive = 1;
                db.Employees.Add(obj);
                return db.SaveChanges();
            }
        }
        public static int UpdateEmployee(Employee model, int EmpNo = 0)
        {

            DeveloperEntities db = new DeveloperEntities();
            bool IsExist = db.Employees.Where(P => P.EmpNo != model.EmpNo).Any(R => R.EmpName == model.EmpName);
            if (IsExist == true)
            {
                return 0;
            }
            else
            {               
               // model.UserId = ESrNo;
                db.Employees.Attach(model);
                db.Entry(model).State = EntityState.Modified;                
                return db.SaveChanges();
            }
        }
        public bool RemoveEmployee(int EmpNo = 0)
        {
            DeveloperEntities db = new DeveloperEntities();
            Employee Obj = db.Employees.Single(t => t.EmpNo == EmpNo);
            if (Obj != null)
            {
                Obj.IsActive=0;
                db.Entry(Obj).State = EntityState.Modified;  
                db.SaveChanges();
            }
            return true;
        }


    }
}