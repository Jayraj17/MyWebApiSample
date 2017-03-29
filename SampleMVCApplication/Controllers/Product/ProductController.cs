using Newtonsoft.Json;
using SampleMapper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SampleMVCApplication.Controllers.Product
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public Product_DTO Edit(string ProIDStr)
        {
            try
            {
                var client = new HttpClient();
                var modelGrid = client.GetAsync(ConfigurationManager.AppSettings["APIURL"] + "api/ProductAPI/GetProduct").Result
                                .Content.ReadAsAsync<List<Product_DTO>>().Result;
                if (ProIDStr != null && ProIDStr != "")
                {
                    var modelEdit = client.GetAsync(ConfigurationManager.AppSettings["APIURL"] + "aapi/ProductAPI/GetProduct" + ProIDStr).Result
                                    .Content.ReadAsStringAsync().Result;

                    var ss = JsonConvert.DeserializeObject<Product_DTO>(modelEdit);
                    var model1 = new Product_DTO
                    {
                        ProductGrid = modelGrid.OrderByDescending(item => item.ProID),
                        ProductEdit = ss
                    };
                    ViewBag.coInit = "<script type='text/javascript'>checkPosition();</script>";
                    return model1;
                }
                else
                {
                    var model = new Product_DTO()
                    {
                        ProductGrid = modelGrid.OrderByDescending(item => item.ProID),
                        ProductEdit = null
                    };
                    return model;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult Product(string ProIDStr)
        {
            try
            {
                return View(Edit(ProIDStr));             
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult Save(Product_DTO product)
        {
            try
            {
                var client = new HttpClient();
                if (product.ProductEdit.ProID == "")
                {
                    product.ProductEdit.UserID = 1;
                    var response = client.PostAsJsonAsync(ConfigurationManager.AppSettings["APIURL"] + "api/ProductAPI/SaveProduct", product.ProductEdit).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        TempData["ErrorProductExist"] = "Success";
                        if (response.ReasonPhrase == "-11")
                            TempData["ErrorProductExist"] = "IsExist";
                    }
                    return RedirectToAction("Product");
                }
                else
                {
                    product.ProductEdit.UserID =1;
                    var response = client.PutAsJsonAsync(ConfigurationManager.AppSettings["APIURL"] + "api/ProductAPI/UpdateProduct",product.ProductEdit).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        TempData["ErrorProductExist"] = "Success";
                        if (response.ReasonPhrase == "-11")
                            TempData["ErrorProductExist"] = "IsExist";
                    }
                    return RedirectToAction("Product");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult Search(string search)
        {
            try
            {
                var client = new HttpClient();
                var modelGrid = client.GetAsync(ConfigurationManager.AppSettings["APIURL"] + "api/ProductAPI/SearchProduct/" + search).Result
                .Content.ReadAsAsync<List<Product_DTO>>().Result;

                var model = new Product_DTO
                {
                    ProductGrid = modelGrid.OrderByDescending(item => item.ProID),
                    ProductEdit = null
                };
                return PartialView("_PartialProductGrid", model);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



    }
}