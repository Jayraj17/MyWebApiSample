using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperHelper2013.SamplePages
{
    public partial class zzzdumm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Test = "";
            string AnsStr = "";
            if (false && true)
            {
                Test = "111";
            }
            AnsStr = Test;
            if (false)
                Test = "";
            AnsStr = "";
        }
    }
}