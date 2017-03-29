using SampleMapper;
using SampleWebApi.Models.CityModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;



namespace SampleWebApi.Controllers.CityCnrl
{
    [RoutePrefix("api/CityApi")]
    public class CityApiController : ApiController
    {
        static readonly ICity CityRep = new City();


        [Route("SaveCity")]
        [HttpPost]
        public HttpResponseMessage SaveCity(CityDTO obj)
        {
            obj = CityRep.SaveCity(obj);
            var Responce = Request.CreateResponse<CityDTO>(HttpStatusCode.Created, obj);           
            return Responce;
        }


        [Route("UpdateCity")]
        [HttpPut]
        public HttpResponseMessage UpdateCity(CityDTO obj)
        {
            if (!CityRep.UpdateCity(obj))
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

        [Route("GetCity")]
        public IEnumerable<CityDTO> GetCity()
        {
            return CityRep.GetAll();
        }

        [Route("GetCity/{id}")]
        public HttpResponseMessage GetCity(int id)
        {
            CityDTO ObjCt = CityRep.Get(id);
            if (ObjCt == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Sorry");
            }
            else
            {
                return Request.CreateResponse<CityDTO>(ObjCt);
            }
        }



    }
}
