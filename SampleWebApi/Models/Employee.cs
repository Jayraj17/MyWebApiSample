//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Employee
    {
        public int EmpNo { get; set; }
        public string EmpName { get; set; }
        public int Salary { get; set; }
        public string DeptName { get; set; }
        public string Designation { get; set; }
        public string EmpFile { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public Nullable<int> IsActive { get; set; }
    }
}
