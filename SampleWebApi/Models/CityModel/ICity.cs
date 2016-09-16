using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleWebApi.Models.CityModel
{
    interface ICity
    {
        CityDTO SaveCity(CityDTO obj);
        bool UpdateCity(CityDTO obj);
        IEnumerable<CityDTO> GetAll();
        CityDTO Get(int id);
    }
}
