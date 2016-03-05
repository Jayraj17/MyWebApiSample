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
        [HttpPost]
        public HttpResponseMessage SaveEmployee(EmpDTO obj)
        {
            obj = EmpRep.SaveEmployee(obj);
            var Responce = Request.CreateResponse<EmpDTO>(HttpStatusCode.Created, obj);
            Responce.ReasonPhrase = Convert.ToString(obj.ResultID);
            return Responce;
        }

        [Route("AddDoc")]
        [HttpPost]
        public HttpResponseMessage AddDoc(DocDTO obj)
        {
            obj = EmpRep.AddDoc(obj);
            var Responce = Request.CreateResponse<DocDTO>(HttpStatusCode.Created, obj);
           // Responce.ReasonPhrase = Convert.ToString(obj.ResultID);
            return Responce;
        }


        [Route("GetEmp")]
        public IEnumerable<EmpDTO> GetEmp()
        {
            return EmpRep.GetAll();
        }

        [Route("GetEmp/{id}")]
        public HttpResponseMessage GetEmp(int id)
        {
            EmpDTO ObjCon = EmpRep.Get(id);
            if (ObjCon == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Sorry");
            }
            else
            {
                return Request.CreateResponse<EmpDTO>(ObjCon);
            }
        }

    }
}
