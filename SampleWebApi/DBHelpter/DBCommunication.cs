using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Entity.Core.EntityClient;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Web;

namespace SampleWebApi.DBHelpter
{
    public class DBCommunication
    {
    }
    public sealed class SpProvider
    {


        public string ExecuteScaler(string Query)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;

            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        cmd.CommandText = Query;
                        return cmd.ExecuteScalar().TryCast<string>();
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }

        #region Context
        private readonly ObjectContext _context = CurrentContext.GetInstance;
        #endregion

        #region DataTable

        public string GetStringValue(string SqlQuery)
        {
            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = SqlQuery;
                    return cmd.ExecuteScalar().TryCast<string>();
                }

            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }
        public DataTable GetTotalRowCount(string SqlQuery)
        {
            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = SqlQuery;
                    DbProviderFactory dbfactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
                    DbCommand command = dbfactory.CreateCommand();
                    command.CommandText = SqlQuery;

                    DbDataAdapter dbDataAdapter = dbfactory.CreateDataAdapter();
                    dbDataAdapter.SelectCommand = cmd;
                    DataTable dataTable = new DataTable();
                    dbDataAdapter.Fill(dataTable);
                    return dataTable;
                    //cmd.ExecuteReader().Cast<DbDataRecord>().Cast<DataRow>().Select(r => r.ItemArray).ToList().ForEach(f => dt.Rows.Add(f));
                    //return dt;
                }

            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }
        public string ExecuteStringScaler(string spName, params object[] parameters)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = "EXECUTE " + spName;
                        for (var i = 0; i < parameters.Length; i++)
                            query += parameters[i].GetParameterInfo() + ",";
                        query = query.TrimEnd(',');
                        cmd.CommandText = query;
                        return Convert.ToString(cmd.ExecuteScalar());
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }
        public DataTable ExecuteStoreProcedure(string SqlQuery, SqlParameter[] par)
        {
            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = SqlQuery;
                    if (par.Length > 0)
                    {
                        for (int i = 0; i < par.Length; i++)
                        {
                            cmd.Parameters.Add(par[i]);
                        }
                    }
                    DbProviderFactory dbfactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
                    DbDataAdapter dbDataAdapter = dbfactory.CreateDataAdapter();
                    dbDataAdapter.SelectCommand = cmd;
                    DataTable dataTable = new DataTable();
                    dbDataAdapter.Fill(dataTable);
                    return dataTable;
                    //cmd.ExecuteReader().Cast<DbDataRecord>().Cast<DataRow>().Select(r => r.ItemArray).ToList().ForEach(f => dt.Rows.Add(f));
                    //return dt;
                }

            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }
        public DataSet ExecuteReportDataSet(string spName, params object[] parameters)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = "EXECUTE " + spName;
                        for (var i = 0; i < parameters.Length; i++)
                            query += parameters[i].GetParameterInfo() + ",";
                        query = query.TrimEnd(',');
                        cmd.CommandText = query;
                        DbProviderFactory dbfactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
                        DbDataAdapter dbDataAdapter = dbfactory.CreateDataAdapter();
                        dbDataAdapter.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        dbDataAdapter.Fill(ds);
                        return ds;
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }
        public DataSet ExecuteDataSet(string SqlQuery)
        {
            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = SqlQuery;
                    DbProviderFactory dbfactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
                    DbDataAdapter dbDataAdapter = dbfactory.CreateDataAdapter();
                    dbDataAdapter.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    dbDataAdapter.Fill(ds);
                    foreach (DataTable item in ds.Tables)
                    {
                        var key = item.PrimaryKey;
                    }

                    return ds;
                    //cmd.ExecuteReader().Cast<DbDataRecord>().Cast<DataRow>().Select(r => r.ItemArray).ToList().ForEach(f => dt.Rows.Add(f));
                    //return dt;
                }

            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }


        public DataTable ExecuteSql(string SqlQuery)
        {
            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = SqlQuery;
                    DbProviderFactory dbfactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
                    DbDataAdapter dbDataAdapter = dbfactory.CreateDataAdapter();
                    dbDataAdapter.SelectCommand = cmd;
                    DataTable dataTable = new DataTable();
                    dbDataAdapter.Fill(dataTable);
                    return dataTable;
                    //cmd.ExecuteReader().Cast<DbDataRecord>().Cast<DataRow>().Select(r => r.ItemArray).ToList().ForEach(f => dt.Rows.Add(f));
                    //return dt;
                }

            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }

        public DataTable ExecuteTVPSqldt(string spName, DataTable TVP, string TVPParameterName, object ParamObject = null)
        {
            var ds = ExecuteTVPSqlds(spName, TVP, TVPParameterName, ParamObject);
            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0];
            }
            else
            {
                return new DataTable();
            }

        }

        public DataSet ExecuteTVPSqlds(string spName, DataTable TVP, string TVPParameterName, object ParamObject = null)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;// _context.Connection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 100000;
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        string query = spName;

                        SqlParameter parameter = new SqlParameter();
                        //The parameter for the SP must be of SqlDbType.Structured 
                        parameter.ParameterName = TVPParameterName;
                        parameter.SqlDbType = System.Data.SqlDbType.Structured;
                        parameter.Value = TVP;
                        cmd.Parameters.Add(parameter);

                        if (ParamObject != null)
                            cmd.Parameters.AddRange(GetParametersFromObject(ParamObject));

                        query = query.TrimEnd(',');
                        cmd.CommandText = query;

                        DbProviderFactory dbfactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
                        DbDataAdapter dbDataAdapter = dbfactory.CreateDataAdapter();
                        dbDataAdapter.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        dbDataAdapter.Fill(ds);
                        return ds;
                        //return Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (initialState == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
            }
        }

        public int ExecuteTVPSql(string spName, DataTable TVP, string TVPParameterName, object ParamObject = null)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;// _context.Connection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 100000;
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        string query = spName;

                        SqlParameter parameter = new SqlParameter();
                        //The parameter for the SP must be of SqlDbType.Structured 
                        parameter.ParameterName = TVPParameterName;
                        parameter.SqlDbType = System.Data.SqlDbType.Structured;
                        parameter.Value = TVP;
                        cmd.Parameters.Add(parameter);

                        if (ParamObject != null)
                            cmd.Parameters.AddRange(GetParametersFromObject(ParamObject));

                        query = query.TrimEnd(',');
                        cmd.CommandText = query;

                        return Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }


        // Return an array of SqlParameter's by using reflection on ParamObject
        private static SqlParameter[] GetParametersFromObject(object ParamObject)
        {

            var Params = new List<SqlParameter>();

            foreach (var PropInfo in ParamObject.GetType().GetProperties())
            {
                Params.Add(new SqlParameter(PropInfo.Name, PropInfo.GetValue(ParamObject, null)));
            }

            return Params.ToArray();

        }

        #endregion
    }

    public sealed class SpProvider_MultiList
    {
        private readonly ObjectContext _context = CurrentContext.GetInstance;

        public List<List<IDataRecord>> ExecuteMultilstSql(string spName, params object[] parameters)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;// _context.Connection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 100000;
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = "EXECUTE " + spName;

                        if (parameters != null)
                            for (var i = 0; i < parameters.Length; i++)
                                query += parameters[i].GetParameterInfo() + ",";
                        query = query.TrimEnd(',');
                        cmd.CommandText = query;


                        DbDataReader dr = cmd.ExecuteReader();
                        List<List<IDataRecord>> _TResult = new List<List<IDataRecord>>();

                        do
                        {
                            _TResult.Add(dr.Cast<IDataRecord>().ToList());
                        }
                        while (dr.NextResult());

                        return _TResult;
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }
    }

    public sealed class SpProvider<TResult> where TResult : new()
    {
        #region Context
        private readonly ObjectContext _context = CurrentContext.GetInstance;
        #endregion

        #region Pagination Sql
        #region Execute SQL
        public Pagination<TResult> PaginationSql(string spName, int PageIndex, int RecordsPerPage, string SortBy, string OrderBy, string SearchText, List<KeyValuePair<string, string>> sqlParams = null)
        {
            var entityConnection = (EntityConnection)_context.Connection;
            //var entityConnection = (System.Data.EntityClient.EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = spName;
                    SqlParameter[] _sqlParams = new SqlParameter[]
                    {
                        new SqlParameter("PageIndex",PageIndex),
                        new SqlParameter("RecordsPerPage",RecordsPerPage),
                        new SqlParameter("SortBy",SortBy),
                        new SqlParameter("OrderBy",OrderBy),
                        new SqlParameter("SearchText",SearchText)
                    };
                    if (sqlParams != null && sqlParams.Any())
                    {
                        cmd.Parameters.AddRange(sqlParams.Select(s => new SqlParameter(s.Key, s.Value)).ToArray());
                    }
                    cmd.Parameters.AddRange(_sqlParams);
                    DbDataReader dr = cmd.ExecuteReader();
                    Pagination<TResult> _pagination = new Pagination<TResult>();
                    _pagination.lstRecords = dr.Cast<IDataRecord>().CastTo<TResult>();

                    ////_pagination.lstRecords = Mapper.Map<IDataRecord, IEnumerable<Student>>(dr.Cast<IDataRecord>()).ToList();
                    if (dr.NextResult())
                    {
                        while (dr.Read())
                            _pagination.pagingInfo.TotalRecords = Convert.ToInt32(dr["TotalRecords"]);
                    }
                    _pagination.pagingInfo.PageNo = PageIndex;
                    _pagination.pagingInfo.PageSize = RecordsPerPage;
                    _pagination.pagingInfo.PagerSize = RecordsPerPage;
                    _pagination.OrderBy = SortBy;
                    _pagination.SortDirection = OrderBy;
                    _pagination.pagingInfo.TotalPages = Math.Ceiling(_pagination.pagingInfo.TotalRecords.TryCast<double>() / RecordsPerPage.TryCast<double>()).TryCast<int>();
                    //Advances the reader to the next result when reading the results of a batch of statements.
                    //if (dr.NextResult())
                    //{
                    //    while (dr.Read())
                    //        _pagination.lstRecordsSecond = dr.Cast<IDataRecord>().CastTo<TResult>(); ;
                    //}
                    return _pagination;
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }


        public Pagination<TResult> PaginationSql(string spName, int PageIndex, int RecordsPerPage, string SortBy, string OrderBy, string SearchText, string paramenterName, string parameterValue)
        {

            //var entityConnection = (System.Data.EntityClient.EntityConnection)_context.Connection;
            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = spName;
                    SqlParameter[] _sqlParams = new SqlParameter[]
                    {
                        new SqlParameter("PageIndex", PageIndex),
                        new SqlParameter("RecordsPerPage", RecordsPerPage),
                        new SqlParameter("SortBy", SortBy),
                        new SqlParameter("OrderBy", OrderBy),
                        new SqlParameter("SearchText", SearchText),
                        //new SqlParameter("Status", Status)
                        new SqlParameter(paramenterName, parameterValue)
                    };
                    cmd.Parameters.AddRange(_sqlParams);
                    DbDataReader dr = cmd.ExecuteReader();
                    Pagination<TResult> _pagination = new Pagination<TResult>();
                    _pagination.lstRecords = dr.Cast<IDataRecord>().CastTo<TResult>();

                    if (dr.NextResult())
                    {
                        while (dr.Read())
                            _pagination.pagingInfo.TotalRecords = Convert.ToInt32(dr["TotalRecords"]);
                    }
                    _pagination.pagingInfo.PageNo = PageIndex;
                    _pagination.pagingInfo.PageSize = RecordsPerPage;
                    _pagination.OrderBy = OrderBy;
                    _pagination.SortDirection = SortBy;
                    return _pagination;
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }
        #endregion
        #endregion

        #region Execute SQL

        public int GetTotalCount(string spName, params object[] parameters)
        {
            var data = parameters.Select(s => new { parm = s, type = s.GetType(), datetype = System.Type.GetType("System.DateTime") });
            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = "EXECUTE " + spName;

                        for (var i = 0; i < parameters.Length; i++)
                            query += parameters[i].GetParameterInfo() + ",";

                        query = query.TrimEnd(',');


                        cmd.CommandText = query;
                        DbParameter param = new SqlParameter();
                        param.Direction = ParameterDirection.Output;
                        param.DbType = DbType.Int32;
                        param.ParameterName = "OutID";
                        cmd.Parameters.Add(param);
                        cmd.ExecuteNonQuery();
                        return 1;
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }

        public TResult ExecuteStringScaler(string Query)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        cmd.CommandText = Query;
                        TResult _TResult = cmd.ExecuteScalar().TryCast<TResult>();
                        return _TResult;
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }

        public TResult ExecuteScaler(string spName, params object[] parameters)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 1000000;
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = "EXECUTE " + spName;

                        for (var i = 0; i < parameters.Length; i++)
                            query += parameters[i].GetParameterInfo() + ",";

                        //foreach (KeyValuePair<string, object> parameter in (parameters.ca as KeyValuePair<string, object>[])) //Been months since I wrote C#, idk if cast is correct
                        //{
                        //}

                        query = query.TrimEnd(',');
                        //query = query.Replace("{ ", "@").Replace(" }", "").TrimEnd(',');
                        cmd.CommandText = query;
                        TResult _TResult = cmd.ExecuteScalar().TryCast<TResult>();
                        return _TResult;
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }

        public TResult ExecuteSql(string spName, params object[] parameters)
        {

            var entityConnection = (EntityConnection)_context.Connection;

            DbConnection conn = entityConnection.StoreConnection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 100000;
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = "EXECUTE " + spName;

                        for (var i = 0; i < parameters.Length; i++)
                            query += parameters[i].GetParameterInfo() + ",";

                        //foreach (KeyValuePair<string, object> parameter in (parameters.ca as KeyValuePair<string, object>[])) //Been months since I wrote C#, idk if cast is correct
                        //{
                        //}

                        query = query.TrimEnd(',');
                        //query = query.Replace("{ ", "@").Replace(" }", "").TrimEnd(',');
                        cmd.CommandText = query;
                        DbDataReader dr = cmd.ExecuteReader();

                        List<TResult> _TResult = dr.Cast<IDataRecord>().CastTo<TResult>();
                        return _TResult.FirstOrDefault();
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
            }
        }

        public List<TResult> ExecuteTVPSqlList(string spName, DataTable TVP, string TVPParameterName, object ParamObject = null)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;// _context.Connection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 100000;
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        string query = spName;

                        SqlParameter parameter = new SqlParameter();
                        //The parameter for the SP must be of SqlDbType.Structured 
                        parameter.ParameterName = TVPParameterName;
                        parameter.SqlDbType = System.Data.SqlDbType.Structured;
                        parameter.Value = TVP;
                        cmd.Parameters.Add(parameter);

                        if (ParamObject != null)
                            cmd.Parameters.AddRange(GetParametersFromObject(ParamObject));

                        query = query.TrimEnd(',');
                        cmd.CommandText = query;

                        //DbProviderFactory dbfactory = DbProviderFactories.GetFactory("System.Data.SqlClient");
                        //DbDataAdapter dbDataAdapter = dbfactory.CreateDataAdapter();
                        //dbDataAdapter.SelectCommand = cmd;
                        //DataTable dataTable = new DataTable();
                        //dbDataAdapter.Fill(dataTable);
                        //return dataTable;

                        DbDataReader dr = cmd.ExecuteReader();

                        List<TResult> _TResult = dr.Cast<IDataRecord>().CastTo<TResult>();
                        return _TResult;

                        //return Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (initialState == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }

        private static SqlParameter[] GetParametersFromObject(object ParamObject)
        {

            var Params = new List<SqlParameter>();

            foreach (var PropInfo in ParamObject.GetType().GetProperties())
            {
                Params.Add(new SqlParameter(PropInfo.Name, PropInfo.GetValue(ParamObject, null)));
            }

            return Params.ToArray();

        }

        public List<TResult> ExecutelstSql(string spName, params object[] parameters)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;// _context.Connection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 100000;
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = "EXECUTE " + spName;

                        if (parameters != null)
                            for (var i = 0; i < parameters.Length; i++)
                                query += parameters[i].GetParameterInfo() + ",";
                        query = query.TrimEnd(',');
                        cmd.CommandText = query;


                        DbDataReader dr = cmd.ExecuteReader();

                        List<TResult> _TResult = dr.Cast<IDataRecord>().CastTo<TResult>();
                        return _TResult;
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }

        public List<TResult> ExecutelstFuction(string fnName, params object[] parameters)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;// _context.Connection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 100000;
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = string.Empty;
                        string param = string.Empty;

                        if (parameters != null)
                        {
                            query = "SELECT * FROM " + fnName + "(";
                            for (var i = 0; i < parameters.Length; i++)
                            {
                                param += parameters[i].GetFunctionParameterInfo() + ",";
                            }
                            query += param.Remove(param.Length - 1) + ")";
                        }

                        cmd.CommandText = query;
                        DbDataReader dr = cmd.ExecuteReader();

                        List<TResult> _TResult = dr.Cast<IDataRecord>().CastTo<TResult>();
                        return _TResult;
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }

        public TResult ExecuteFuction(string fnName, params object[] parameters)
        {

            var entityConnection = (EntityConnection)_context.Connection;
            DbConnection conn = entityConnection.StoreConnection;// _context.Connection;
            ConnectionState initialState = conn.State;
            try
            {
                if (initialState != ConnectionState.Open)
                    conn.Open();  // open connection if not already open
                using (DbCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandTimeout = 100000;
                    cmd.CommandType = CommandType.Text;
                    try
                    {
                        string query = string.Empty;
                        string param = string.Empty;

                        if (parameters != null)
                        {
                            query = "SELECT " + fnName + "(";
                            for (var i = 0; i < parameters.Length; i++)
                            {
                                param += parameters[i].GetFunctionParameterInfo() + ",";
                            }
                            query += param.Remove(param.Length - 1) + ")";
                        }

                        cmd.CommandText = query;

                        TResult _TResult = cmd.ExecuteScalar().TryCast<TResult>();
                        return _TResult;
                    }
                    catch (Exception exception)
                    {
                        throw new DataException(exception.Message);
                    }
                }
            }
            finally
            {
                if (conn.State != ConnectionState.Open)
                    conn.Close(); // only close connection if not initially open
                conn.Dispose();
            }
        }


        #endregion
    }


    public static class StringHelper
    {
        public static string GetParameterInfo(this object obj)
        {
            List<string> strs = obj.ToString().Split('=').ToList();
            if (strs.Count > 2)
            {
                strs[1] = string.Join("=", strs.Skip(1).Select(s => s).ToArray());

            }
            if (strs.Count > 1)
            {
                if (obj.GetType().FullName.ToLower().Contains("system.datetime"))
                {
                    return " @" + strs[0].Replace("{ ", "").Trim() + " = '" + (!string.IsNullOrEmpty(strs[1].Replace(" }", "").Trim()) ? strs[1].Replace(" }", "").Trim().TryCast<DateTime>().ToString("yyyy-MM-dd HH:mm:ss") : null) + "'";
                }
                return " @" + strs[0].Replace("{ ", "").Trim() + " = '" + strs[1].Replace(" }", "").Replace("'", "''").Trim() + "'";
            }
            return null;
        }

        public static string GetFunctionParameterInfo(this object obj)
        {
            List<string> strs = obj.ToString().Split('=').ToList();
            if (strs.Count > 1)
            {
                if (obj.GetType().FullName.ToLower().Contains("system.datetime"))
                {
                    return "'" + (!string.IsNullOrEmpty(strs[1].Replace(" }", "").Trim()) ? strs[1].Replace(" }", "").Trim().TryCast<DateTime>().ToString("yyyy-MM-dd HH:mm:ss") : null) + "'";
                }
                return "'" + strs[1].Replace(" }", "").Replace("'", "''").Trim() + "'";
            }
            return null;
        }
    }

    public static class LinqHelper
    {
        public static IQueryable<TSource> WhereLike<TSource>(this IQueryable<TSource> source, Expression<Func<TSource, string>> valueSelector, string value, char wildcard)
        {
            return source.Where(BuildLikeExpression(valueSelector, value, wildcard));
        }

        public static Expression<Func<TElement, bool>> BuildLikeExpression<TElement>(Expression<Func<TElement, string>> valueSelector, string value, char wildcard)
        {
            if (valueSelector == null)
                throw new ArgumentNullException("valueSelector");
            var method = GetLikeMethod(value, wildcard);
            value = value.Trim(wildcard);
            var body = Expression.Call(valueSelector.Body, method, Expression.Constant(value));
            var parameter = valueSelector.Parameters.Single();
            return Expression.Lambda<Func<TElement, bool>>(body, parameter);
        }

        private static MethodInfo GetLikeMethod(string value, char wildcard)
        {
            var methodName = "Contains";
            var textLength = value.Length;
            value = value.TrimEnd(wildcard);
            if (textLength > value.Length)
            {
                methodName = "StartsWith";
                textLength = value.Length;
            }
            value = value.TrimStart(wildcard);
            if (textLength > value.Length)
            {
                methodName = (methodName == "StartsWith") ? "Contains" : "EndsWith";
                textLength = value.Length;
            }

            var stringType = typeof(string);
            return stringType.GetMethod(methodName, new Type[] { stringType });
        }
        public static IQueryable<TEntity> WhereIn<TEntity, TValue>(this ObjectQuery<TEntity> query, Expression<Func<TEntity, TValue>> selector, IEnumerable<TValue> collection)
        {
            ParameterExpression p = selector.Parameters.Single();
            //if there are no elements to the WHERE clause,
            //we want no matches:
            if (!collection.Any()) return query.Where(x => false);
            if (collection.Count() > 3000) //could move this value to config
                throw new ArgumentException("Collection too large - execution will cause stack overflow", "collection");
            IEnumerable<Expression> equals = collection.Select(value =>
               (Expression)Expression.Equal(selector.Body,
                    Expression.Constant(value, typeof(TValue))));
            Expression body = equals.Aggregate((accumulate, equal) =>
                Expression.Or(accumulate, equal));
            return query.Where(Expression.Lambda<Func<TEntity, bool>>(body, p));
        }
    }
}