using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleWebApi.Models.CountryModel
{
    interface ICountry
    {
        CountryDTO SaveCountry(CountryDTO obj);
        bool UpdateCountry(CountryDTO obj);
        IEnumerable<CountryDTO> GetAll();
        CountryDTO Get(int id);
    }
}
