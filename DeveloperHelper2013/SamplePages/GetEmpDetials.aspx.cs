using Newtonsoft.Json;
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
            dt = DBCommunication.GetEmployeeDetails("");       
        
        }
        [WebMethod]
        public static string GetEmpDetails(Dictionary<string, string>  SendObj)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = DBCommunication.GetEmployeeDetails(SendObj["Name"]);
                string JsonData = JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented);
                return JsonData;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}