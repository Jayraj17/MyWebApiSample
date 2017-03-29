using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleMapper
{
    public class ModuleDTO
    {
        public ModuleDTO()
        {
            //this.TicketStatusDTO = new HashSet<TicketStatusDTO>();
        }

        public int ModuleID { get; set; }
        public int ProjectID { get; set; }
        public string ProjectName { get; set; }
        public string ModuleName { get; set; }
        public string ModuleVer { get; set; }
        public bool Active { get; set; }
        public Nullable<int> Created_by { get; set; }
        public Nullable<int> Modified_By { get; set; }
        public Nullable<System.DateTime> Created_Date { get; set; }
        public Nullable<System.DateTime> Modified_Date { get; set; }

        public virtual ProjectDTO ProjectDTO { get; set; }
      //  public virtual ICollection<TicketStatusDTO> TicketStatusDTO { get; set; }
        public IEnumerable<ModuleDTO> ModulesGrid { get; set; }
        public ModuleDTO ModulesEdit { get; set; }
    }
}
