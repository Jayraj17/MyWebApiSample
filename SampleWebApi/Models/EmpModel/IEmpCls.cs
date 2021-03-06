﻿using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleWebApi.Models.EmpModel
{
    interface IEmpCls
    {

        EmpDTO SaveEmployee(EmpDTO obj);
        DocDTO AddDoc(DocDTO obj);
        IEnumerable<EmpDTO> GetAll();
        EmpDTO Get(int id);
    }
}
