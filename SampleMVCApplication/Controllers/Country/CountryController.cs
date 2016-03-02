using Newtonsoft.Json;
using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace SampleMVCApplication.Controllers.Country
{
    public class CountryController : Controller
    {
        // GET: CountryApi
        public ActionResult Country(int? id)
        {
            return View(Edit(id));
        }


        public CountryDTO Edit(int? id)
        {
            try
            {
                var client = new HttpClient();
                var modelGrid = client.GetAsync("http://localhost:6198/api/CountryApi/GetCountry").Result
                .Content.ReadAsAsync<List<CountryDTO>>().Result;
                if (id != null && id != 0)
                {
                    var modelEdit = client.GetAsync("http://localhost:6198/api/CountryApi/GetCountry/" + id).Result
                            .Content.ReadAsStringAsync().Result;
                    var ss = JsonConvert.DeserializeObject<CountryDTO>(modelEdit);
                    var model = new CountryDTO()
                    {
                        CountryGrid = modelGrid.OrderByDescending(item => item.CID),
                        CountryEdit = ss
                    };
                    return model;
                }
                else
                {
                    var model = new CountryDTO()
                    {
                        CountryGrid = modelGrid.OrderByDescending(item => item.CID),
                        CountryEdit = null
                    };
                    return model;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult Save(CountryDTO ObjCt)
        {
            try
            {
                var client = new HttpClient();
                if (ObjCt.CountryEdit.CID == 0)
                {

                    var response = client.PostAsJsonAsync("http://localhost:6198/api/CountryApi/SaveCountry", ObjCt.CountryEdit).Result;
                    if (response.IsSuccessStatusCode)
                    {


                    }
                    return RedirectToAction("Country");
                }
                else
                {

                    var response = client.PutAsJsonAsync("http://localhost:6198/api/CountryApi/UpdateCountry", ObjCt.CountryEdit).Result;
                    if (response.IsSuccessStatusCode)
                    {

                    }
                    return RedirectToAction("Country");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}