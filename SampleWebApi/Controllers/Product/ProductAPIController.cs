//using SampleWebApi.Models.Product;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SampleMapper;
using SampleWebApi.Models.Product;



namespace SampleWebApi.Controllers
{
    [RoutePrefix("api/ProductAPI")]
    public class ProductAPIController : ApiController
    {
        static readonly IProduct ProductRepository = new Product();

        [Route("GetProduct")]
        public IEnumerable<Product_DTO> GetProduct()
        {
            return ProductRepository.GetAll();
        }
        [Route("GetProduct/{id}")]
        public HttpResponseMessage GetProduct(string ProIDStr)
        {
            Product_DTO product = ProductRepository.Get(ProIDStr);
            if (product == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Not found");
            }
            else
            {
                return Request.CreateResponse<Product_DTO>(product);
            }
        }
        [Route("UpdateProduct")]
        public HttpResponseMessage PutMST_Projects(Product_DTO product)
        {
            if (!ProductRepository.Update(product))
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Not found");
            }
            else
            {
                var response = Request.CreateResponse(HttpStatusCode.OK);
                //response.ReasonPhrase = Convert.ToString(product.ProID; // Return the output Id of the procedure in response.
                return response;
            }
        }
        [Route("SaveProduct")]
        public HttpResponseMessage SaveProjects(Product_DTO product)
        {
            product = ProductRepository.Add(product);
            var response = Request.CreateResponse<Product_DTO>(HttpStatusCode.Created, product);
          //  response.ReasonPhrase = Convert.ToString(product.ProID); // Return the output Id of the procedure in response.
            return response;
        }
        [Route("SearchProduct/{search=null}")]
        public IEnumerable<Product_DTO> GetProductSearch(string search)
        {
            return ProductRepository.SearchProduct(search);
        }
    }
}
