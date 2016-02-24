using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleWebApi.Models.EmpModel
{
    interface IEmpCls
    {
        EmpDTO GetEmployee(string EmpName);
        EmpDTO GetAllByList();
        List<EmpDTO> GetAllEmployeeList();
        IEnumerable<EmpDTO> GetAllEmployee();
        EmpDTO SaveEmployee(EmpDTO obj);
    }
}
