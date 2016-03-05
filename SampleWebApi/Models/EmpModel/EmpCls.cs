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



        public DocDTO AddDoc(DocDTO obj)
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
                        DB.Sp_InsertUpdateDoc(0,obj.EmpNo,obj.DocName);
                        //obj.ResultID = Convert.ToString(OutputParamValue.Value);
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


        public IEnumerable<EmpDTO> GetAll()
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                var EmpData = ConvertObjectToData(0);
                if (EmpData != null)
                {
                    //objCnty.CountryGrid = CountryData;
                    return EmpData;
                }
                return null;
            }
        }

        public EmpDTO Get(int id)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                var EmpData = ConvertObjectToData(id);
                if (EmpData != null)
                {
                   // objCnty.CountryEdit = CountryData.Single();
                    return EmpData.Single();
                }
                return null;
            }
        }




        public IEnumerable<EmpDTO> ConvertObjectToData(int id)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {
                var Result = from result in DB.GetEmpDetails(id).ToList()
                             select new EmpDTO
                             {

                                 EmpNo=result.EmpNo,
                                 EmpName = result.EmpName,
                                 Salary = result.Salary,
                                 DeptName = result.DeptName,
                                 Designation=result.Designation,
                                 UserName=result.UserName,
                                 Password = result.Password                                 
                             };

                return Result;
            }
        }

    }
}