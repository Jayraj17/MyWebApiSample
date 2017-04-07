using System;
using System.Collections.Generic;
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
    
    
    }
}