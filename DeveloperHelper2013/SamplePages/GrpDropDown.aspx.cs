using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperHelper2013.SamplePages
{
    public partial class GrpDropDown : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }
        void BindData()
        {

            string query = "select ID,Item,Grp from ItemMst";
            string constr = ConfigurationManager.ConnectionStrings["StudSrt"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);



                            string category = "";
                            foreach (DataRow row in dt.Rows)
                            {
                                if (category != Convert.ToString(row["Grp"]))
                                {
                                    //ddlPropertyTypes.ExtendedItems.Add(new SharpPieces.Web.Controls.ExtendedListItem(Convert.ToString(row["Item"]), Convert.ToString(row["ID"]), true, SharpPieces.Web.Controls.ListItemGroupingType.New, Convert.ToString(row["Grp"])));
                                    //category = Convert.ToString(row["Grp"]);
                                }
                                else
                                {
                                    //ddlPropertyTypes.ExtendedItems.Add(new SharpPieces.Web.Controls.ExtendedListItem(Convert.ToString(row["Item"]), Convert.ToString(row["ID"]), true, SharpPieces.Web.Controls.ListItemGroupingType.Inherit, Convert.ToString(row["Grp"])));
                                }
                            }
                            //ddlPropertyTypes.DataBind();
                        }






                    }
                }
            }


        }
    }
}