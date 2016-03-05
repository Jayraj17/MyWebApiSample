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
        public string EmpFile { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool IsActive { get; set; }
        public string ResultID { get; set; }
        public virtual DocDTO DocDTO { get; set; }

      }
    public class DocDTO
    {
        public int DocID { get; set; }
        public int EmpNo { get; set; }
        public string DocName { get; set; }
    }


}
