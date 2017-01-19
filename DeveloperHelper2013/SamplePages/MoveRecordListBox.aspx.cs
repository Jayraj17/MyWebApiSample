using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperHelper2013.SamplePages
{
    public partial class MoveRecordListBox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void test_Click(object sender, EventArgs e)
        {

            DataTable dt = null;  //DBCommunication.GetStData(1);
            string Str = HdnID.Value;
            string test = Str.TrimStart(',');
            string[] StrCount = test.Split(',');
            for (int i = 0; i < StrCount.Length; i++)
            {
                //if (StrCount[i].ToString() != dt.Rows[i]["RefID"].ToString())
                //{
                //   DBCommunication.UpdateStudent(Convert.ToInt32(dt.Rows[i]["SrNo"]), Convert.ToInt32(StrCount[i].ToString()));             
                //}
               // DBCommunication.UpdateStudent(Convert.ToInt32(StrCount[i].ToString()), i + 1);
            }
            BindList();
        }

        void BindList()
        {

            ListItem li = new ListItem();

            DataTable dt = null;//DBCommunication.GetStData(1);
            LstBox.DataSource = dt;
            LstBox.DataTextField = "Name";
            LstBox.DataValueField = "SrNo";
            // li.Attributes.Add("title", LstBox.DataTextField);
            // LstBox.Items.Add(li);   
            LstBox.DataBind();

            /*Tool Tip in List Box*/

            foreach (ListItem _listItem in this.LstBox.Items)
            {
                _listItem.Attributes.Add("title", _listItem.Text);

            }


        }
    }
}