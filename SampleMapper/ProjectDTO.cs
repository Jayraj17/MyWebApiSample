using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleMapper
{
    class ProjectDTO
    {
        public ProjectDTO()
        {
          //  this.MST_Modules = new HashSet<ModuleDTO>();
           // this.TRN_Tickets = new HashSet<TRNTicketsDTO>();
        }

        public int ProjectID { get; set; }
        public string ProjectName { get; set; }
        public string ProjectVer { get; set; }
        public bool Active { get; set; }
        public Nullable<int> Created_by { get; set; }
        public Nullable<int> Modified_By { get; set; }
        public Nullable<System.DateTime> Created_Date { get; set; }
        public Nullable<System.DateTime> Modified_Date { get; set; }

     //   public virtual ICollection<ModuleDTO> MST_Modules { get; set; }
     //   public virtual ICollection<TRNTicketsDTO> TRN_Tickets { get; set; }
        public IEnumerable<ProjectDTO> ProjectGrid { get; set; }
        public ProjectDTO ProjectEdit { get; set; }
    }
}
