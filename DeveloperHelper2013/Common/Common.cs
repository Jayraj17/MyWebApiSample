using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DeveloperHelper2013.Common
{
    public class Common
    {
        //public static int InsertErrorLog(Common ErrorObj)
        //{
        //    int Result = 0;
        //    string serverIP = string.Empty;
        //    System.Net.IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName());
        //    System.Net.IPAddress[] addr = ipEntry.AddressList;
        //    for (int i = 0; i < addr.Length; i++)
        //    {
        //        serverIP += string.Format("{1}<br>", i, addr[i].ToString());
        //    }

        //    SqlConnection conn = DBConnection.GetConnection();
        //    SqlCommand cmd = new SqlCommand("EP_Admin_InsertErrorLog", conn);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.Add("@MessageTitle", SqlDbType.VarChar).Value = ErrorObj.message;
        //    cmd.Parameters.Add("@MessageDetail", SqlDbType.VarChar).Value = ErrorObj.stack;
        //    cmd.Parameters.Add("@ServerName", SqlDbType.VarChar).Value = System.Net.Dns.GetHostName();
        //    cmd.Parameters.Add("@ServerIP", SqlDbType.VarChar).Value = serverIP;
        //    cmd.Parameters.Add("@ClientIP", SqlDbType.VarChar).Value = System.Web.HttpContext.Current.Request.UserHostName;
        //    cmd.Parameters.Add("@RequestUrl", SqlDbType.VarChar).Value = ErrorObj.requestUrl;
        //    cmd.Parameters.Add("@Created_By", SqlDbType.VarChar).Value = SessionManager.UserName;

        //    try
        //    {
        //        conn.Open();
        //        Result = cmd.ExecuteNonQuery();
        //    }
        //    catch (Exception)
        //    {
        //    }
        //    finally
        //    {
        //        conn.Close();
        //        cmd.Connection = null;
        //        cmd.Dispose();
        //    }
        //    return Result;
        //}
    }
}