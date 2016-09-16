using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace DeveloperHelper2013
{
    public class DBCommunication
    {
        #region GetICD
        //Connection 

        string constr1 = WebConfigurationManager.ConnectionStrings["DeveloperConnectionString"].ConnectionString;
        internal DataTable GetICD()
        {
            DataSet ds = new DataSet();
            ConStr sql = new ConStr();
            sql.Filltable(ds, "ICD_Mst", "GetAllICD", new SqlParameter[] { });
            return ds.Tables[0];
        }

          internal bool ChangeSeq(string ICD,int Seq)
        {

            bool success = false;
            SqlConnection con = new SqlConnection(constr1);

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "UpdateSeqICD";
            cmd.Parameters.Add("@ICD", SqlDbType.VarChar).Value = ICD;
            cmd.Parameters.Add("@Seq", SqlDbType.Int).Value = Seq;  


            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                success = true;                

            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                con.Close();
                con.Dispose();
            }
            return success;         


        }  

        #endregion

      
    }
}