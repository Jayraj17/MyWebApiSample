using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleWebApi.Models.CityModel
{
    public class City : ICity
    {
        private CityDTO ObjCityDTO = new CityDTO();



        public CityDTO SaveCity(CityDTO obj)
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                using (var dbContextTransaction = DB.Database.BeginTransaction())
                {

                    try
                    {
                        DB.Configuration.ProxyCreationEnabled = false;
                        DB.Configuration.LazyLoadingEnabled = false;
                        if (obj == null)
                        {
                            throw new ArgumentNullException("item");
                        }
                        DB.InsertCity(0,obj.CountryID,obj.CityName);                       
                        DB.SaveChanges();
                        dbContextTransaction.Commit();
                        return obj;
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }

                }
            }
        }
        public bool UpdateCity(CityDTO obj)
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                using (var dbContextTransaction = DB.Database.BeginTransaction())
                {
                    try
                    {
                        DB.Configuration.ProxyCreationEnabled = false;
                        DB.Configuration.LazyLoadingEnabled = false;
                        if (obj == null)
                        {
                            throw new ArgumentNullException("item");
                        }
                        DB.InsertCity(obj.CID,obj.CountryID,obj.CityName);
                        DB.SaveChanges();
                        dbContextTransaction.Commit();
                        return true;
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        throw;
                    }

                }
            }
        }
        public IEnumerable<CityDTO> GetAll()
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                var CityData = ConvertObjectToData(0);
                if (CityData != null)
                {
                    ObjCityDTO.CityGrid = CityData;
                    return CityData;
                }
                return null;
            }
        }
        public CityDTO Get(int id)
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                var CityData = ConvertObjectToData(id);
                if (CityData != null)
                {
                    ObjCityDTO.CityEdit = CityData.Single();
                    return CityData.Single();
                }
                return null;
            }
        }
        public IEnumerable<CityDTO> ConvertObjectToData(int id)
        {
            using (DeveloperEntities DB = new DeveloperEntities())
            {
                var Result = from result in DB.GetCity(id).ToList()
                             select new CityDTO
                             {
                                 CityName=result.CityName,                              
                                 CID = result.CID, 
                                 CountryDTO = new CountryDTO { CountryName = result.CountryName}
                             };

                return Result;
            }
        }
    }
}