using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DeveloperHelper2013
{
    public partial class ICDSeqChange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBCommunication obj = new DBCommunication();
            DataTable dt = obj.GetICD();
        }
    }
}