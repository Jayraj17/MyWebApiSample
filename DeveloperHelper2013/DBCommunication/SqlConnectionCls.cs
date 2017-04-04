using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace DeveloperHelper2013.DBCommunication
{
    public static class SqlConnectionCls
    {
       public  static String ConStr = WebConfigurationManager.ConnectionStrings["DeveloperConnectionString"].ConnectionString;
    }
}