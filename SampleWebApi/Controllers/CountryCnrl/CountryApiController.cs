using SampleMapper;
using SampleWebApi.Models.CountryModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SampleWebApi.Controllers.CountryCnrl
{
    [RoutePrefix("api/CountryApi")]
    public class CountryApiController : ApiController
    {
        static readonly ICountry Counobj = new Country();
        [Route("SaveCountry")]
        [HttpPost]
        public HttpResponseMessage SaveCountry(CountryDTO obj)
        {
            obj = Counobj.SaveCountry(obj);
            var Responce = Request.CreateResponse<CountryDTO>(HttpStatusCode.Created, obj);
            return Responce;
        }
        [Route("UpdateCountry")]
        [HttpPut]
        public HttpResponseMessage UpdateCountry(CountryDTO obj)
        {
            if (!Counobj.UpdateCountry(obj))
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Sorry");
            }
            else
            {
                var response = Request.CreateResponse(HttpStatusCode.OK);
                response.ReasonPhrase = Convert.ToString(obj.CID); // Return the output Id of the procedure in response.
                return response;
            }
        }

        [Route("GetCountry")]
        public IEnumerable<CountryDTO> GetCountry()
        {
            return Counobj.GetAll();
        }

        [Route("GetCountry/{id}")]
        public HttpResponseMessage GetCountry(int id)
        {
            CountryDTO ObjCon = Counobj.Get(id);
            if (ObjCon == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Sorry");
            }
            else
            {
                return Request.CreateResponse<CountryDTO>(ObjCon);
            }
        }
    }
}
