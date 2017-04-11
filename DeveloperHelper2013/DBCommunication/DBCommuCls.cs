using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace DeveloperHelper2013.DBCommunication
{
    public class DBCommuCls
    {
        #region GetICD
        //Connection 

        public static SqlConnection con = new SqlConnection(SqlConnectionCls.ConStr);
       
        internal DataTable GetICD()
        {




            DataSet ds = new DataSet();
            ConStr sql = new ConStr();
            sql.Filltable(ds, "ICD_Mst", "GetAllICD", new SqlParameter[] { });
            return ds.Tables[0];
        }

        internal bool ChangeSeq(string ICD, int Seq)
        {

            bool success = false;           

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


        internal static DataTable GetEmployeeDetails(string EmpName, int EmpNo)
        {
          
            try
            {

                using (SqlConnection connection = new SqlConnection(SqlConnectionCls.ConStr))
                {

                    SqlCommand cmd = new SqlCommand();
                    SqlDataAdapter da = new SqlDataAdapter();
                    DataTable dt = new DataTable();


                    cmd.Parameters.AddWithValue("@EmpName", EmpName);
                    cmd.Parameters.AddWithValue("@EmpNo", EmpNo);
                    cmd.CommandText = "GetEmpDetails";
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Connection = connection;
                    da.SelectCommand = cmd;
                    da.Fill(dt);
                    return dt;
                }


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

        }

        #endregion

        #region Employee


        internal static int InsertEmployee(int EmpNo, string EmpName, int Salary, string DeptName, string Designation, string EmpFile, string UserName, string Password)
        {

            try
            {
                int Res = 0;               

                SqlCommand cmd = new SqlCommand();

                cmd.Parameters.Add("@EmpNo", EmpNo);
                cmd.Parameters.Add("@EmpName", EmpName);
                cmd.Parameters.Add("@Salary", Salary);
                cmd.Parameters.Add("@DeptName", DeptName);
                cmd.Parameters.Add("@Designation", Designation);
                cmd.Parameters.Add("@EmpFile", EmpFile);
                cmd.Parameters.Add("@UserName", UserName);
                cmd.Parameters.Add("@Password", Password);


                /*OUT*/
                cmd.Parameters.Add("@Result", SqlDbType.VarChar, 5);
                cmd.Parameters["@Result"].Direction = ParameterDirection.Output;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsertEmployee";
                cmd.Connection = con;
                con.Open();
                Res = cmd.ExecuteNonQuery();
                Res = Convert.ToInt32(cmd.Parameters["@Result"].Value.ToString());
                con.Close();
                return Res;


            }
            catch (Exception)
            {
                
                throw;
            }
        
        
        }


      


        #endregion
    }
}