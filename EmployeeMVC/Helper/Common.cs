using EmployeeMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmployeeMVC.Helper
{
    public class Common
    {
        public static List<SelectListItem> GetCityMst()
        {
            List<SelectListItem> lst = new List<SelectListItem>();
            DeveloperEntities db = new DeveloperEntities();
            List<CityMaster> lst1 = db.CityMasters.Where(p => p.IsActive == 1).OrderBy(Q => Q.CityName).ToList();
            lst.Add(new SelectListItem { Text = "[Select]", Value = "-9" });
            foreach (var item in lst1)
            {
                lst.Add(new SelectListItem { Text = item.CityName, Value = item.CID.ToString() });
            }
            return lst;
        }

        public static SelectList GetRegister()
        {
            var list = new SelectList(new[]
                       {
                             new { ID="-9",Name="[Select]"},
                             new {ID="1",Name="Operator"},
                             new{ID="2",Name="Supervisor"},
                             new{ID="3",Name="Signal man"},
                             new{ID="4",Name="Helper"},
                             new{ID="5",Name="Consultant"},
                        },
                          "ID", "Name", -9);
            return list;
        }
    }
}