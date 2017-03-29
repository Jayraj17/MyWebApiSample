﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SampleWebApi.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class DeveloperEntities : DbContext
    {
        public DeveloperEntities()
            : base("name=DeveloperEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CityMaster> CityMasters { get; set; }
        public virtual DbSet<Product_Mst> Product_Mst { get; set; }
    
        public virtual ObjectResult<GetEmpDetails_Result> GetEmpDetails(string empName)
        {
            var empNameParameter = empName != null ?
                new ObjectParameter("EmpName", empName) :
                new ObjectParameter("EmpName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetEmpDetails_Result>("GetEmpDetails", empNameParameter);
        }
    
        public virtual int InsertEmployee(Nullable<int> empNo, string empName, Nullable<int> salary, string deptName, string designation, string empFile, string userName, string password, ObjectParameter result)
        {
            var empNoParameter = empNo.HasValue ?
                new ObjectParameter("EmpNo", empNo) :
                new ObjectParameter("EmpNo", typeof(int));
    
            var empNameParameter = empName != null ?
                new ObjectParameter("EmpName", empName) :
                new ObjectParameter("EmpName", typeof(string));
    
            var salaryParameter = salary.HasValue ?
                new ObjectParameter("Salary", salary) :
                new ObjectParameter("Salary", typeof(int));
    
            var deptNameParameter = deptName != null ?
                new ObjectParameter("DeptName", deptName) :
                new ObjectParameter("DeptName", typeof(string));
    
            var designationParameter = designation != null ?
                new ObjectParameter("Designation", designation) :
                new ObjectParameter("Designation", typeof(string));
    
            var empFileParameter = empFile != null ?
                new ObjectParameter("EmpFile", empFile) :
                new ObjectParameter("EmpFile", typeof(string));
    
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("InsertEmployee", empNoParameter, empNameParameter, salaryParameter, deptNameParameter, designationParameter, empFileParameter, userNameParameter, passwordParameter, result);
        }
    
        public virtual ObjectResult<GetAllCountry_Result> GetAllCountry(Nullable<int> cID)
        {
            var cIDParameter = cID.HasValue ?
                new ObjectParameter("CID", cID) :
                new ObjectParameter("CID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetAllCountry_Result>("GetAllCountry", cIDParameter);
        }
    
        public virtual ObjectResult<GetCity_Result> GetCity(Nullable<int> cID)
        {
            var cIDParameter = cID.HasValue ?
                new ObjectParameter("CID", cID) :
                new ObjectParameter("CID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetCity_Result>("GetCity", cIDParameter);
        }
    
        public virtual int InsertCity(Nullable<int> cID, Nullable<int> countryID, string city)
        {
            var cIDParameter = cID.HasValue ?
                new ObjectParameter("CID", cID) :
                new ObjectParameter("CID", typeof(int));
    
            var countryIDParameter = countryID.HasValue ?
                new ObjectParameter("CountryID", countryID) :
                new ObjectParameter("CountryID", typeof(int));
    
            var cityParameter = city != null ?
                new ObjectParameter("City", city) :
                new ObjectParameter("City", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("InsertCity", cIDParameter, countryIDParameter, cityParameter);
        }
    
        public virtual int InsertUpdateCountry(Nullable<int> cID, string countryName)
        {
            var cIDParameter = cID.HasValue ?
                new ObjectParameter("CID", cID) :
                new ObjectParameter("CID", typeof(int));
    
            var countryNameParameter = countryName != null ?
                new ObjectParameter("CountryName", countryName) :
                new ObjectParameter("CountryName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("InsertUpdateCountry", cIDParameter, countryNameParameter);
        }
    
        public virtual int Sp_InsertEduMst(Nullable<int> eID, string eName, Nullable<int> isActive)
        {
            var eIDParameter = eID.HasValue ?
                new ObjectParameter("EID", eID) :
                new ObjectParameter("EID", typeof(int));
    
            var eNameParameter = eName != null ?
                new ObjectParameter("EName", eName) :
                new ObjectParameter("EName", typeof(string));
    
            var isActiveParameter = isActive.HasValue ?
                new ObjectParameter("IsActive", isActive) :
                new ObjectParameter("IsActive", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Sp_InsertEduMst", eIDParameter, eNameParameter, isActiveParameter);
        }
    
        public virtual ObjectResult<SP_GetProduct_Result> SP_GetProduct(string proName)
        {
            var proNameParameter = proName != null ?
                new ObjectParameter("ProName", proName) :
                new ObjectParameter("ProName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_GetProduct_Result>("SP_GetProduct", proNameParameter);
        }
    
        public virtual int Sp_InsertUpdateProduct(string proID, string proName, Nullable<System.DateTime> proExpDate, Nullable<int> userID)
        {
            var proIDParameter = proID != null ?
                new ObjectParameter("ProID", proID) :
                new ObjectParameter("ProID", typeof(string));
    
            var proNameParameter = proName != null ?
                new ObjectParameter("ProName", proName) :
                new ObjectParameter("ProName", typeof(string));
    
            var proExpDateParameter = proExpDate.HasValue ?
                new ObjectParameter("ProExpDate", proExpDate) :
                new ObjectParameter("ProExpDate", typeof(System.DateTime));
    
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Sp_InsertUpdateProduct", proIDParameter, proNameParameter, proExpDateParameter, userIDParameter);
        }
    }
}
