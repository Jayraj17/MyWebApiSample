using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleWebApi.Models.Product
{
    public interface IProduct
    {
        IEnumerable<Product_DTO> GetAll();
        IEnumerable<Product_DTO> SearchProduct(string search);
        Product_DTO Get(string ProIDStr);
        Product_DTO Add(Product_DTO product);
        void Remove(string ProIDStr);
        bool Update(Product_DTO product);
    }
}