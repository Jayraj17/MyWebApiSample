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

        [Route("SaveEmployee")]
        public HttpResponseMessage SaveEmployee(EmpDTO obj)
        {
            obj = EmpRep.SaveEmployee(obj);
            var Responce = Request.CreateResponse<EmpDTO>(HttpStatusCode.Created, obj);
            Responce.ReasonPhrase = Convert.ToString(obj.ResultID);
            return Responce;
        }
    }
}
