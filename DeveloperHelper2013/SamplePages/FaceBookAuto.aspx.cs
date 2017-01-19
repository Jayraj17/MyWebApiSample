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
    public partial class FaceBookAuto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string GetData(string Key)
        {

            DataTable GetDT = null;// DBCommunication.GetData();
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in GetDT.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in GetDT.Columns)
                {
                    row.Add(col.ColumnName, dr[col] == DBNull.Value ? "-" : Convert.ToString(dr[col]));
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);


        }
        [WebMethod]
        public static string GetDataS(string Key, string Type)
        {

            DataTable GetDT =null;// DBCommunication.GetDataS(Key, Type);
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in GetDT.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in GetDT.Columns)
                {
                    row.Add(col.ColumnName, dr[col] == DBNull.Value ? "-" : Convert.ToString(dr[col]));
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);


        }
    }
}