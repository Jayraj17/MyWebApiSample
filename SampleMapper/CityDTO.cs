using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleMapper
{
    
    public class CityDTO
    {
        public int CID { get; set; }
        public string CityName { get; set; }
        public IEnumerable<CityDTO> CityGrid { get; set; }
        public CityDTO CityEdit { get; set; }

        public int CountryID { get; set; }

        public virtual CountryDTO CountryDTO { get; set; }
    }
    public class CountryDTO
    {
        public int CID { get; set; }
        public string CountryName { get; set; }
        public IEnumerable<CountryDTO> CountryGrid { get; set; }
        public CountryDTO CountryEdit { get; set; }
    }
   
}
