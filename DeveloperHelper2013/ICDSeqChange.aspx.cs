using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DeveloperHelper2013
{
    public partial class ICDSeqChange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBCommunication obj = new DBCommunication();
           bool test =obj.ChangeSeq("007",8);

        }


        [WebMethod]
        public static string GetICDa()
        {           
            DBCommunication obj = new DBCommunication();
            DataTable dt = obj.GetICD();          
            string json = JsonConvert.SerializeObject(dt, Formatting.Indented);
            return json;
        }
         [WebMethod]
        public static string ChangeSeq(Dictionary<string, string> SendObj)
        {
            string Res="";
           DBCommunication obj = new DBCommunication();
           bool Result = Convert.ToBoolean(obj.ChangeSeq(SendObj["ICD"], Convert.ToInt32(SendObj["Seq"])));
           return Res;
        }



        

    }
}