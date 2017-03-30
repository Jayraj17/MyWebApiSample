using SampleMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;

namespace SampleWebApi.Models.Product
{
    public class Product : IProduct
    {
        ObjectParameter OutputParamValue = new ObjectParameter("output", typeof(string));
        private List<Product_DTO> product = new List<Product_DTO>();
        private Product_DTO ObjProductDTO = new Product_DTO();

        public IEnumerable<Product_DTO> ConvertProjectsObjectData(string ProIDStr)
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                var Result = from result in DB.SP_GetProduct(ProIDStr).ToList()
                             select new Product_DTO
                             {
                                 ProID = result.ProID.ToString(),
                                 ProName = result.ProName,
                                 ProExpDate = result.ProEpxDate
                             };

                return Result;
            }
        }
        public IEnumerable<Product_DTO> GetAll()
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                var AllProductData = ConvertProjectsObjectData("");
                if (AllProductData != null)
                {
                    ObjProductDTO.ProductGrid = AllProductData;
                    return AllProductData;
                }
                return null;
            }
        }

        public Product_DTO Get(string ProIDStr)
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                var ProductData = ConvertProjectsObjectData(ProIDStr);
                if (ProductData != null && ProductData.Count() > 0)
                {
                    ObjProductDTO.ProductEdit = ProductData.Single();
                    return ProductData.SingleOrDefault();
                }
                return null;
            }
        }

        public IEnumerable<Product_DTO> SearchProduct(string search)
        {
            if (search == "null")
            {
                return GetAll();
            }
            else
            {
                using (DeveloperEntities DB = new DeveloperEntities())
                {
                    DB.Configuration.ProxyCreationEnabled = false;
                    DB.Configuration.LazyLoadingEnabled = false;
                    var SearchData = from result in ConvertProjectsObjectData("").ToList()
                                     where result.ProName.StartsWith(search, StringComparison.OrdinalIgnoreCase) || result.ProName.Contains(search)
                                     select result;
                    return SearchData;
                }
            }
        }

        public Product_DTO Add(Product_DTO product)
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                if (product == null)
                {
                    throw new ArgumentNullException("item");
                }
                DB.Sp_InsertUpdateProduct("",product.ProName,product.ProExpDate,1);
                DB.SaveChanges();
                // product.ProID = Convert.ToInt32(OutputParamValue.Value);
                return product;
            }
        }

        public bool Update(Product_DTO product)
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                if (product == null)
                {
                    throw new ArgumentNullException("item");
                }
                DB.Sp_InsertUpdateProduct(product.ProID,product.ProName,product.ProExpDate,1);
               // product.proID = Convert.ToInt32(OutputParamValue.Value);
                DB.SaveChanges();
                return true;
            }
        }
        public void Remove(string ProIDStr)
        {
            
                     
        }


    }
}