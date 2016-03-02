using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SampleMapper;
using System.Data.Entity.Core.Objects;

namespace SampleWebApi.Models.EmpModel
{
    public class EmpCls : IEmpCls
    {
        ObjectParameter OutputParamValue = new ObjectParameter("Result", typeof(string));
       

        public EmpDTO SaveEmployee(EmpDTO obj)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {
                using (var dbContextTransaction = DB.Database.BeginTransaction())
                {
                    try
                    {
                        DB.Configuration.ProxyCreationEnabled = false;
                        DB.Configuration.LazyLoadingEnabled = false;
                        if (obj == null)
                        {
                            throw new ArgumentNullException("item");
                        }
                        DB.InsertEmployee(0, obj.EmpName, obj.Salary, obj.DeptName, obj.Designation, obj.EmpFile, obj.UserName, obj.Password, OutputParamValue);
                        obj.ResultID = Convert.ToString(OutputParamValue.Value);
                        DB.SaveChanges();
                        dbContextTransaction.Commit();
                        return obj;
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }

                }
            }
        }
    }
}