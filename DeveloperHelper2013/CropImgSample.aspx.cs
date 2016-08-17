﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DeveloperHelper2013
{
    public partial class CropImgSample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void Upload(object sender, EventArgs e)
        {
            string base64 = Request.Form["imgCropped"];
            byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
            using (System.IO.FileStream stream = new System.IO.FileStream(Server.MapPath("~/Images/Cropped.png"), System.IO.FileMode.Create))
            {
                stream.Write(bytes, 0, bytes.Length);
                stream.Flush();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string path = Server.MapPath("~/ProImages");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            string base64 = Request.Form["imgCropped"];
            byte[] bytes = Convert.FromBase64String(base64.Split(',')[1]);
            using (System.IO.FileStream stream = new System.IO.FileStream(Server.MapPath("~/ProImages/Cropped.png"), System.IO.FileMode.Create))
            {
                stream.Write(bytes, 0, bytes.Length);
                stream.Flush();
            }

        }
    }
}