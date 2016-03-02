using SampleMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleWebApi.Models.CountryModel
{
    public class Country : ICountry
    {
        CountryDTO objCnty = new CountryDTO();
        public CountryDTO SaveCountry(CountryDTO obj)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
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
                        DB.InsertUpdateCountry(0, obj.CountryName);
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
        public bool UpdateCountry(CountryDTO obj)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
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
                        DB.InsertUpdateCountry(obj.CID, obj.CountryName);
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

        public IEnumerable<CountryDTO> GetAll()
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                var CountryData = ConvertObjectToData(0);
                if (CountryData != null)
                {
                    objCnty.CountryGrid = CountryData;
                    return CountryData;
                }
                return null;
            }
        }

        public CountryDTO Get(int id)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {
                DB.Configuration.ProxyCreationEnabled = false;
                DB.Configuration.LazyLoadingEnabled = false;
                var CountryData = ConvertObjectToData(id);
                if (CountryData != null)
                {
                    objCnty.CountryEdit = CountryData.Single();
                    return CountryData.Single();
                }
                return null;
            }
        }


        public IEnumerable<CountryDTO> ConvertObjectToData(int id)
        {
            using (GeesemedLocalEntities DB = new GeesemedLocalEntities())
            {
                var Result = from result in DB.GetAllCountry(id).ToList()
                             select new CountryDTO
                             {
                                 CountryName = result.CountryName,
                                 CID = result.CID
                             };

                return Result;
            }
        }
    }
}