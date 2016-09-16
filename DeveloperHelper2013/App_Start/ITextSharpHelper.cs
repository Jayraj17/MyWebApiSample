using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;

namespace DeveloperHelper2013.App_Start
{
    public class ITextSharpHelper
    {
        public void GetPDFCCMPatMonthlyRpt(DataSet Ds, string PdfTitle)
        {


            MemoryStream stream = new MemoryStream();
            stream = CCMPDFDATA(Ds, PdfTitle);
            // Download PDF
            System.Web.HttpContext.Current.Response.ContentType = "application/pdf";
            System.Web.HttpContext.Current.Response.AppendHeader("content-disposition", "attachment;filename=" + PdfTitle + ".PDF");
            System.Web.HttpContext.Current.Response.BinaryWrite(stream.ToArray());
            System.Web.HttpContext.Current.Response.End();

        }

        private MemoryStream CCMPDFDATA(DataSet Ds, string PdfTitle)
        {
            PdfDiv DvHeaderMain = new PdfDiv();

            PdfDiv DvHeaderHead = new PdfDiv();
            PdfDiv DvHeaderHeadSub = new PdfDiv();
            PdfDiv DvHeaderLeft = new PdfDiv();
            PdfDiv DvSubHeaderLeft = new PdfDiv();
            PdfDiv DvHeaderRight = new PdfDiv();
            PdfDiv DvHeaderLogo = new PdfDiv();
            PdfDiv DvData = new PdfDiv();


            ///LOGO
            ///
            iTextSharp.text.Image logoimg = null;
            logoimg = iTextSharp.text.Image.GetInstance(System.Web.HttpContext.Current.Server.MapPath("~/App_Themes/NewTheme/Images/Geesemed_logo.jpg"));
            logoimg.ScaleToFit(80f, 80f);
            logoimg.Alignment = iTextSharp.text.Image.ALIGN_RIGHT;

            DvHeaderLogo.AddElement(logoimg);
            DvHeaderLogo.TextAlignment = Element.ALIGN_RIGHT;


            MemoryStream ms = new MemoryStream();
            iTextSharp.text.Rectangle rect = PageSize.A4;
            Document CCMDoc = new Document(rect, 25f, 25f, 25f, 40f);
            PdfWriter writer_Sub = PdfWriter.GetInstance(CCMDoc, ms);

            writer_Sub.PageEvent = new PDFDashBoardFooter();

            CCMDoc.Open();

            DvHeaderMain.AddElement(logoimg);


           // ClientMasterDAL objClient = new ClientMasterDAL(SessionManager.CONNECTIONSTRING);
            DataTable dtHead = new DataTable();
            //dtHead = objClient.GetClient_Master(SessionManager.CLIENT_ID);
            string CliName = "";
            string CliAdd = "";
            string CityState = "";
            string PhoneFax = "";
            string City = "";
            string State = "";
            string Zip = "";
            string Phone = "";
            string FAX = "";

            if (dtHead.Rows.Count != 0)
            {
                CliName = Convert.ToString(dtHead.Rows[0]["mclnt_name"]);
                CliAdd = Convert.ToString(dtHead.Rows[0]["mdl_add1"]) + " " + Convert.ToString(dtHead.Rows[0]["mdl_add2"]);
                City = Convert.ToString(dtHead.Rows[0]["city_name"]);
                State = Convert.ToString(dtHead.Rows[0]["state_code"]);
                Zip = Convert.ToString(dtHead.Rows[0]["zip_code"]);
                Phone = Convert.ToString(dtHead.Rows[0]["mclnt_cont_phone"]);
                FAX = Convert.ToString(dtHead.Rows[0]["mclnt_fax"]);
            }




            if (City != "")
            {
                CityState += City;
            }
            if (State != "")
            {
                CityState += (City != "" ? ", " : "") + State;
            }
            if (Zip != "")
            {
                CityState += " " + Zip;
            }
            if (Phone != "")
            {
                PhoneFax += "(T): " + Phone;
            }
            if (FAX != "")
            {
                PhoneFax += " (F): " + FAX;
            }

            //LEFT
            string PatName = string.Empty;
            string BDate = string.Empty;
            string Gender = string.Empty;
            if (Ds.Tables[0].Rows.Count != 0)
            {
                PatName = Ds.Tables[0].Rows[0]["mpt_pat_name"].ToString();
                BDate = Ds.Tables[0].Rows[0]["BDate"].ToString();
                Gender = Ds.Tables[0].Rows[0]["mpt_pat_sex"].ToString();
            }
          //  clsHospital objHosp = new clsHospital(SessionManager.CONNECTIONSTRING, SessionManager.HOSPITAL_ID);
            string hospName = "trest"; //objHosp.getHospitalName();


         //   DvHeaderLeft.Float = PdfDiv.FloatType.LEFT;


            DvHeaderLeft.AddElement(new Chunk(hospName + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));
            DvHeaderLeft.AddElement(new Chunk(CliName + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));
            DvHeaderLeft.AddElement(new Chunk(CliAdd + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));
            DvHeaderLeft.AddElement(new Chunk(CityState + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));
            DvHeaderLeft.AddElement(new Chunk(PhoneFax + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));


            DvHeaderLeft.Width = 180f;
            DvHeaderLeft.PaddingTop = 10f;
            DvHeaderMain.AddElement(DvHeaderLeft);


            //RIGHT
            PdfPTable PtableRight = new PdfPTable(1);
            DvHeaderRight.Float = PdfDiv.FloatType.RIGHT;


            PdfPCell cell = new PdfPCell(new Phrase(new Chunk(PdfTitle, ITextSharpHelper.GetCommonSubTitle_Chart())));
            cell.Border = 0;
            cell.HorizontalAlignment = PdfPCell.ALIGN_RIGHT;
            PtableRight.AddCell(cell);





            DvHeaderRight.PaddingTop = 10f;
            DvHeaderRight.Width = 290f;
            DvHeaderRight.AddElement(PtableRight);

            DvHeaderMain.AddElement(DvHeaderRight);

            ///SUB Head



            DvSubHeaderLeft.AddElement(new Chunk(new LineSeparator(0.8f, 100f, BaseColor.GRAY, Element.ALIGN_CENTER, 1)));



            DvSubHeaderLeft.AddElement(new Chunk("Patient :- " + PatName + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));
            DvSubHeaderLeft.AddElement(new Chunk("DOB :- " + BDate + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));
            DvSubHeaderLeft.AddElement(new Chunk("Gender :- " + Gender + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));
            DvSubHeaderLeft.AddElement(new Chunk("Physician :- " + Ds.Tables[1].Rows[0]["ProName"].ToString() + "\n", ITextSharpHelper.GetCommonSubTitle_Chart()));




            DvSubHeaderLeft.Width = 540f;
            //   DvSubHeaderLeft.PercentageWidth = 80f;
            DvHeaderMain.AddElement(DvSubHeaderLeft);


            CCMDoc.Add(DvHeaderMain);
            //DvData.AddElement(ExportToPdf(Ds));
            ExportToPdf(Ds, ref CCMDoc);
            //DvHeaderMain.AddElement(DvData);



            CCMDoc.Close();

            return ms;
        }
        public void ExportToPdf(DataSet ds, ref Document CCMDoc)
        {
            PdfPTable PdfTable = new PdfPTable(1);
            PdfTable.WidthPercentage = 98f;
            PdfTable.DefaultCell.Border = 1;
            PdfPCell PdfPCell = null;
            PdfPCell PdfPCellMain = null;
            PdfPCell PdfPCellSub = null;
            int CarGrdID = 0;



            PdfTable.SplitLate = false;
            PdfTable.SplitRows = true;


            PdfTable.DefaultCell.Border = 0;
            PdfTable.AddCell(new Phrase(new Chunk(new LineSeparator(0.8f, 100f, BaseColor.GRAY, Element.ALIGN_CENTER, 1))));

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {

                if (CarGrdID != Convert.ToInt32(ds.Tables[1].Rows[i]["TitleGroupID"]))
                {

                    PdfPCellMain = new PdfPCell(new Phrase(new Chunk(ds.Tables[1].Rows[i]["TitleGroupName"].ToString() + "\n\n", ITextSharpHelper.GetHead())));
                    PdfPCellMain.Border = 0;
                    PdfTable.AddCell(PdfPCellMain);



                    PdfPCellSub = new PdfPCell(new Phrase(new Chunk(ds.Tables[1].Rows[i]["TitleDisplayName"].ToString(), ITextSharpHelper.GetSubHead())));
                    PdfPCellSub.Border = 0;
                    PdfTable.AddCell(PdfPCellSub);
                    PdfPCell = new PdfPCell(new Phrase(new Chunk(ds.Tables[1].Rows[i]["TitleValue"].ToString() + "\n\n", ITextSharpHelper.GetDetials())));
                    PdfPCell.Border = 0;
                    PdfTable.AddCell(PdfPCell);



                }
                else
                {
                    PdfPCellSub = new PdfPCell(new Phrase(new Chunk(ds.Tables[1].Rows[i]["TitleDisplayName"].ToString(), ITextSharpHelper.GetSubHead())));
                    PdfPCellSub.Border = 0;
                    PdfTable.AddCell(PdfPCellSub);
                    PdfPCell = new PdfPCell(new Phrase(new Chunk(ds.Tables[1].Rows[i]["TitleValue"].ToString() + "\n\n", ITextSharpHelper.GetDetials())));
                    PdfPCell.Border = 0;
                    PdfTable.AddCell(PdfPCell);
                }

                CarGrdID = Convert.ToInt32(ds.Tables[1].Rows[i]["TitleGroupID"]);
            }


            ///////////////////////////////////////////////////////////////CCM DATA
            int CCMGrdID = 0;
            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {

                if (CCMGrdID != Convert.ToInt32(ds.Tables[2].Rows[i]["TitleGroupID"]))
                {
                    PdfPCellMain = new PdfPCell(new Phrase(new Chunk(ds.Tables[2].Rows[i]["TitleGroupName"].ToString() + "\n\n", ITextSharpHelper.GetHead())));
                    PdfPCellMain.Border = 0;
                    PdfTable.AddCell(PdfPCellMain);



                    PdfPCellSub = new PdfPCell(new Phrase(new Chunk(ds.Tables[2].Rows[i]["TitleDisplayName"].ToString(), ITextSharpHelper.GetSubHead())));
                    PdfPCellSub.Border = 0;
                    PdfTable.AddCell(PdfPCellSub);
                    PdfPCell = new PdfPCell(new Phrase(new Chunk(ds.Tables[2].Rows[i]["TitleValue"].ToString() + "\n\n", ITextSharpHelper.GetDetials())));
                    PdfPCell.Border = 0;
                    PdfTable.AddCell(PdfPCell);



                }
                else
                {
                    PdfPCellSub = new PdfPCell(new Phrase(new Chunk(ds.Tables[2].Rows[i]["TitleDisplayName"].ToString(), ITextSharpHelper.GetSubHead())));
                    PdfPCellSub.Border = 0;
                    PdfTable.AddCell(PdfPCellSub);
                    PdfPCell = new PdfPCell(new Phrase(new Chunk(ds.Tables[2].Rows[i]["TitleValue"].ToString() + "\n\n", ITextSharpHelper.GetDetials())));
                    PdfPCell.Border = 0;
                    PdfTable.AddCell(PdfPCell);
                }

                CCMGrdID = Convert.ToInt32(ds.Tables[2].Rows[i]["TitleGroupID"]);
            }

            CCMDoc.Add(PdfTable);
        }


        #region PDF - FONT


        public static Font GetHead()
        {
            Font CommonFont = new Font(Font.GetFamilyIndex("Arial"), 16f, Font.BOLD, new iTextSharp.text.BaseColor(87, 85, 85));
            return CommonFont;
        }
        public static Font GetSubHead()
        {
            Font CommonFont = new Font(Font.GetFamilyIndex("Arial"), 12f, Font.BOLD, new iTextSharp.text.BaseColor(87, 85, 85));
            return CommonFont;
        }
        public static Font GetDetials()
        {
            Font CommonFont = new Font(Font.GetFamilyIndex("Arial"), 10f, Font.NORMAL, new iTextSharp.text.BaseColor(87, 85, 85));
            return CommonFont;
        }
        public static Font GetBoldFont(float size)
        {
            size = 10f; // changed on 07/28/2015 - Changed from Dynamic
            Font retObj = new Font();
            retObj.SetStyle("Italic");
            retObj.Size = size;
            return retObj;
        }
        public static Font GetCommonFont()
        {
            Font CommonFont = new Font(Font.GetFamilyIndex("Arial"), 10f, Font.NORMAL, new iTextSharp.text.BaseColor(87, 85, 85));
            return CommonFont;
        }
        public static Font GetCommonFontHead()
        {
            Font CommonFont = new Font(Font.GetFamilyIndex("Arial"), 10f, Font.BOLD, new iTextSharp.text.BaseColor(87, 85, 85));
            return CommonFont;
        }
        public static Font GetCommonFont(float size)
        {
            size = 10f; // changed on 07/28/2015 - Changed from Dynamic
            Font CommonFont = new Font(Font.GetFamilyIndex("Arial"), size, Font.NORMAL, new iTextSharp.text.BaseColor(87, 85, 85));
            return CommonFont;
        }

        //CHART 
        public static Font GetCommonFont_Chart()
        {
            iTextSharp.text.Font docf = FontFactory.GetFont(FontFactory.HELVETICA, 10, new iTextSharp.text.BaseColor(87, 85, 85));
            return docf;
        }
        public static Font GetCommonFontBold_Chart()
        {
            iTextSharp.text.Font docf = FontFactory.GetFont(FontFactory.HELVETICA, 10, iTextSharp.text.Font.BOLD, new iTextSharp.text.BaseColor(87, 85, 85));
            return docf;
        }
        public static Font GetCommonTitle_Chart()
        {
            iTextSharp.text.Font hf = FontFactory.GetFont(FontFactory.HELVETICA, 14, iTextSharp.text.Font.BOLD, BaseColor.GRAY);
            return hf;
        }
        public static Font GetCommonSubTitle_Chart()
        {
            iTextSharp.text.Font hf = FontFactory.GetFont(FontFactory.HELVETICA, 10, BaseColor.GRAY);
            return hf;
        }
        public static Font GetCommonPatDetails_Chart()
        {
            iTextSharp.text.Font docf = FontFactory.GetFont(FontFactory.HELVETICA, 10, BaseColor.GRAY);
            return docf;
        }
        public static Font GetCommonFontBold_Chart_Gray()
        {
            iTextSharp.text.Font docf = FontFactory.GetFont(FontFactory.HELVETICA, 10, iTextSharp.text.Font.BOLD, BaseColor.GRAY);
            return docf;
        }



        #endregion
    }
}

public class PDFDashBoardFooter : PdfPageEventHelper
{
    // This is the contentbyte object of the writer
    PdfContentByte cb;

    // we will put the final number of pages in a template
    PdfTemplate headerTemplate, footerTemplate;

    // this is the BaseFont we are going to use for the header / footer
    BaseFont bf = null;

    public PDFDashBoardFooter()
    {
    }
    public override void OnOpenDocument(PdfWriter writer, Document document)
    {
        try
        {
            bf = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            cb = writer.DirectContent;
            headerTemplate = cb.CreateTemplate(100, 100);
            footerTemplate = cb.CreateTemplate(50, 50);
        }
        catch (DocumentException de)
        {
            //handle exception here
        }
        catch (System.IO.IOException ioe)
        {
            //handle exception here
        }
    }
    // write on start of each page
    public override void OnStartPage(PdfWriter writer, Document document)
    {
    }
    // DisplayPageNumber - ADDED BY CHINTAN ON 11/05/2015 FOR DISPLAY PAGE NUMBER IN CHART PDF
    public void DisplayPageNumber(PdfWriter writer, Document document)
    {
        string text = "Page " + writer.PageNumber + " of ";
        //Add paging to header
        {
            cb.BeginText();
            cb.SetFontAndSize(bf, 12);
            cb.SetColorFill(BaseColor.GRAY);
            cb.SetTextMatrix(document.PageSize.GetRight(100), document.PageSize.GetTop(45));
            cb.ShowText(text);
            cb.EndText();
            float len = bf.GetWidthPoint(text, 12);
            cb.AddTemplate(headerTemplate, document.PageSize.GetRight(100) + len, document.PageSize.GetTop(45));
        }
    }
    // write on end of each page
    public override void OnEndPage(PdfWriter writer, Document document)
    {
        base.OnEndPage(writer, document);
        PdfPTable tabFot = new PdfPTable(3);
        PdfPCell cellDate;
        PdfPCell cellCretedBy;
        PdfPCell cellPage;
        tabFot.TotalWidth = 700F;
        cellDate = new PdfPCell(new Phrase("Date : " + DateTime.Now.ToString("MM/dd/yyyy")));
        cellCretedBy = new PdfPCell(new Phrase("Created By www.geesemed.com"));
        cellPage = new PdfPCell(new Phrase("Page." + writer.PageNumber));
        tabFot.AddCell(cellDate);
        tabFot.AddCell(cellCretedBy);
        tabFot.AddCell(cellPage);

        cb.BeginText();
        cb.SetFontAndSize(bf, 10);

        cb.SetTextMatrix(40f, document.PageSize.GetBottom(10));
        cb.ShowText("Date : " + DateTime.Now.ToString("MM/dd/yyyy"));
        cb.SetTextMatrix(230f, document.PageSize.GetBottom(10));
        cb.ShowText(" Created By www.geesemed.com");
        cb.SetTextMatrix(520f, document.PageSize.GetBottom(10));
        cb.ShowText("Page." + writer.PageNumber);
        cb.EndText();
        float len = bf.GetWidthPoint("Date : " + DateTime.Now.ToString("MM/dd/yyyy"), 12);
        float len1 = bf.GetWidthPoint(" Created By www.geesemed.com", 12);
        float len2 = bf.GetWidthPoint("Page." + writer.PageNumber, 12);
        cb.AddTemplate(footerTemplate, 10f, document.PageSize.GetBottom(25));

        // tabFot.WriteSelectedRows(0,-1, 40, document.Bottom, writer.DirectContent);
        //Move the pointer and draw line to separate footer section from rest of page
        cb.MoveTo(40, document.PageSize.GetBottom(25));
        cb.LineTo(document.PageSize.Width - 40, document.PageSize.GetBottom(25));
        cb.Stroke();
    }
    public override void OnCloseDocument(PdfWriter writer, Document document)
    {
        // THIS WILL PRINT CURRENT PAGE WITH TOTAL NUMBER OF PAGE IN HEAEDR
        base.OnCloseDocument(writer, document);
        headerTemplate.BeginText();
        headerTemplate.SetFontAndSize(bf, 12);
        headerTemplate.SetTextMatrix(0, 0);
        headerTemplate.ShowText((writer.PageNumber - 1).ToString());
        headerTemplate.EndText();
    }

}