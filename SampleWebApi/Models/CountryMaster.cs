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
    
    public partial class CountryMaster
    {
        public CountryMaster()
        {
            this.CityMasters = new HashSet<CityMaster>();
        }
    
        public int CID { get; set; }
        public string CountryName { get; set; }
        public Nullable<int> IsActive { get; set; }
    
        public virtual ICollection<CityMaster> CityMasters { get; set; }
    }
}
