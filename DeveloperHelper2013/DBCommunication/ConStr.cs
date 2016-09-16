using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace DeveloperHelper2013
{
    public class ConStr
    {
        SqlConnection cn = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();



        public void CreateConnectionObject()
        {
            string constr1 = WebConfigurationManager.ConnectionStrings["DeveloperConnectionString"].ConnectionString;
            cn = new SqlConnection(constr1);
            cn.Open();

        }
        public void DisposeConnection()
        {
            if (cn != null)
            {
                cn.Dispose();
                cn.Close();

            }

        }
        public void ExeSP(string Spname, SqlParameterCollection parameters)
        {
            SqlCommand cmd = new SqlCommand();
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = Spname;
                foreach (SqlParameter param in parameters)
                {
                    cmd.Parameters.Add(param);
                }
                CreateConnectionObject();
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
            }
            finally
            {

                cmd.Dispose();
                cn.Close();
                DisposeConnection();

            }


        }
        public void Filltable(DataSet appDataset, string appTableName, string spName, SqlParameter[] parameters)
        {
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = spName;
            foreach (SqlParameter param in parameters)
            {
                sqlCommand.Parameters.Add(param);
            }
            CreateConnectionObject();
            sqlCommand.Connection = cn;
            da = new SqlDataAdapter();
            da.SelectCommand = sqlCommand;
            try
            {
                da.Fill(appDataset, appTableName);
            }
            finally
            {
                cn.Close();
                sqlCommand.Connection = null;
                sqlCommand.Dispose();
                da.Dispose();
                DisposeConnection();
            }
        }
    }
}