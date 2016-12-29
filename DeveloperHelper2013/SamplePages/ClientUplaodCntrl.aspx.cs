using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperHelper2013
{
    public partial class ClientUplaodCntrl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        [System.Web.Services.WebMethod]
        public static string SaveImage(Dictionary<string, string> SendObj)
        {
            string Based64BinaryString = SendObj["binimage"];
            string result = "";
            try
            {
                string path = HttpContext.Current.Server.MapPath("Images/");
                string name = DateTime.Now.ToString("hhmmss");
                string str = Based64BinaryString.Replace("data:text/htm;base64,", " ");//jpg check          
                str = str.Replace("data:text/html;base64,", " ");//text file check
                byte[] data = Convert.FromBase64String(str);
                MemoryStream ms = new MemoryStream(data, 0, data.Length);
                ms.Write(data, 0, data.Length);
                string FilePath = "Images/" + name + ".html";
                FileStream file = new FileStream(path + name + ".html", FileMode.Create, FileAccess.Write);
                ms.WriteTo(file);
                file.Close();
                ms.Close();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
                con.Open();
                string query = "insert into tblFileUpload values ('" + SendObj["name"] + "','" + FilePath + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                result = "file uploaded successfully";
            }
            catch (Exception ex)
            {
                result = "Error : " + ex;
            }
            return result;
        }
    }
}