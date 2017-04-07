using DeveloperHelper2013.DBCommunication;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperHelper2013.SamplePages
{
    public partial class GetEmpDetials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillDetails();

        }
        public void FillDetails()
        {
            DataTable dt = new DataTable();
            dt = DBCommuCls.GetEmployeeDetails("",0);

        }
        [WebMethod]
        public static string GetEmpDetails(Dictionary<string, string> SendObj)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = DBCommuCls.GetEmployeeDetails(SendObj["Name"], Convert.ToInt32(SendObj["EmpNo"]));
                string JsonData = JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented, new IsoDateTimeConverter() { DateTimeFormat = "MM/dd/yyyy" });
                return JsonData;
            }
            catch (Exception)
            {
                throw;
            }
        }
        [WebMethod]
        public static string InsertEmpData(Dictionary<string, string> SendObj)
        {
            string ResMsg = "";
            int Res = DBCommuCls.InsertEmployee(0, SendObj["EmpName"], Convert.ToInt32(SendObj["Sal"]), SendObj["Dept"], SendObj["Des"], SendObj["FileName"], SendObj["UserName"], SendObj["Pass"]);
            return ResMsg;
        }
    }
}