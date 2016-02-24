using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleMapper
{
    public class EmpDTO
    {
        public int EmpNo { get; set; }
        public string EmpName { get; set; }

        public int Salary { get; set; }

        public string DeptName { get; set; }

        public string Designation { get; set; }
        //public int Result { get; set; }

             
        public string RId { get; set; }
        //public virtual RegDTO RegDTO { get; set; }


        public RegDTO RegDTO { get; set; }
       


        


        
        
    }


    public class RegDTO
    {
        public int REmpNo { get; set; }
        public string REmpName { get; set; }

        public int RSalary { get; set; }

        public string RDeptName { get; set; }

        public string RDesignation { get; set; }
        //public int Result { get; set; }
        public zzDTO zzDTO { get; set; }


       
    }


    public class zzDTO
    {
        public int zzmpNo { get; set; }
        public string zzmpName { get; set; }

        public int zzSalary { get; set; }

    }
}
