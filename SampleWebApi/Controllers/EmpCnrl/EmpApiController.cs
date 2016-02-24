using SampleMapper;
using SampleWebApi.Models.EmpModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SampleWebApi.Controllers.EmpCnrl
{
    [RoutePrefix("api/EmpApi")]
    public class EmpApiController : ApiController
    {
      
        static readonly IEmpCls EmpRep = new EmpCls();

       

        [Route("GetEmpDetails")]
        [HttpPost]
        public HttpResponseMessage GetEmpDetails(string EmpName)
        {
            EmpDTO objEmpDTO = EmpRep.GetEmployee(EmpName);
            if (objEmpDTO == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Sorry Not Call This Method");
            }
            else
            {
                return Request.CreateResponse<EmpDTO>(objEmpDTO);
            }
        }
        [Route("GetAllByList")]
        public HttpResponseMessage GetAllByList()
        {
            EmpDTO objEmpDTO = EmpRep.GetAllByList();
            if (objEmpDTO == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Sorry Not Call This Method");
            }
            else
            {
                return Request.CreateResponse<EmpDTO>(objEmpDTO);
            }
        }

        [Route("SaveEmployee")]
        public HttpResponseMessage SaveEmployee(EmpDTO obj)
        {
            obj = EmpRep.SaveEmployee(obj);
            var Responce = Request.CreateResponse<EmpDTO>(HttpStatusCode.Created, obj);
            //Responce.ReasonPhrase = Convert.ToString(obj.Result);
            return Responce;
        }
    }
}
