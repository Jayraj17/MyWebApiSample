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
        ObjectParameter OutputParamValue = new ObjectParameter("output", typeof(string));
     
        public EmpDTO GetEmployee(string EmpName)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {

                var Result = from p in DB.GetEmpDetails(EmpName).ToList()
                             select new EmpDTO
                          {
                              EmpName = p.EmpName,
                              Salary = p.Salary,
                              DeptName = p.DeptName,
                              Designation = p.Designation
                          };
                return Result.Single();
            }
        }

        public EmpDTO GetAllByList()
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {

                var Result = from p in DB.GetEmpDetails("")
                             where p.EmpName.Contains("JAYRAJ")
                             select new EmpDTO
                             {
                                 EmpNo = p.EmpNo,
                                 EmpName = p.EmpName,
                                 Salary = p.Salary,
                                 DeptName = p.DeptName,
                                 Designation = p.Designation
                             };
                return Result.SingleOrDefault();
            }
        }


        public List<EmpDTO> GetAllEmployeeList()
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {

                var Result = from p in DB.GetEmpDetails("")
                             where p.EmpName.Contains("JAYRAJ")
                             select new EmpDTO
                             {
                                 EmpNo = p.EmpNo,
                                 EmpName = p.EmpName,
                                 Salary = p.Salary,
                                 DeptName = p.DeptName,
                                 Designation = p.Designation
                             };
                return Result.ToList();
            }
        }
        public IEnumerable<EmpDTO> GetAllEmployee()
        {

            EmpDTO ob = new EmpDTO();
       

            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {

                var Result = from p in DB.GetEmpDetails("")
                             where p.EmpName.Contains("JAYRAJ")
                             select new EmpDTO
                             {
                                 EmpNo = p.EmpNo,
                                 EmpName = p.EmpName,
                                 Salary = p.Salary,
                                 DeptName = p.DeptName,
                                 Designation = p.Designation
                                
                                 
                             };
                return Result.AsEnumerable();
            }
        }

        public EmpDTO SaveEmployee(EmpDTO obj)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {

                DB.InsertEmployee(obj.EmpName, obj.Salary, obj.DeptName, obj.Designation, OutputParamValue);
                DB.SaveChanges();
               // obj.Result = Convert.ToInt32(OutputParamValue.Value);
                return obj;
                
            }        
        }       
    }
}