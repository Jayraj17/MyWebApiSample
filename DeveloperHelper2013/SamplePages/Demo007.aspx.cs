using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DeveloperHelper2013
{
    public partial class Demo007 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }
        XDocument xmldoc;
        public void BindGrid()
        {
            xmldoc = XDocument.Load(Server.MapPath("~/XmlDB/Emp.xml"));   //add xml document  
            var bind = xmldoc.Descendants("Employee").Select(p => new
            {
                Id = p.Element("id").Value,
                Name = p.Element("name").Value,
                Salary = p.Element("salary").Value,
                Email = p.Element("email").Value,
                Address = p.Element("address").Value
            }).OrderBy(p => p.Id);
            GridView1.DataSource = bind;
            GridView1.DataBind();
        }  
    }
}