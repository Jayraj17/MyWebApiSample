using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleMapper
{
    public class Product_DTO
    {
        public string ProID { get; set; }
        public string ProName { get; set; }      
        public Nullable<System.DateTime> ProExpDate { get; set; }
        public int UserID { get; set; }

        public IEnumerable<Product_DTO> ProductGrid { get; set; }
        public Product_DTO ProductEdit { get; set; }
        
    }
}
