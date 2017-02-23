<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportToExcelClient.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.ExportToExcelClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <script type="text/javascript">

        function RptDataExpt() {
            ShowProcess();
            if (DateValidation() == true) {
                var StatuStr = '';
                var SignStatus = "0";
                if (jq("#ddlSuperBillStatus").val() == "-1") {
                    var arr = [];
                    var fStr = "";
                    jq('#ddlSuperBillStatus option').each(function () {
                        if (this.value != "-1") {
                            arr.push(this.value);
                        }
                    });
                    fStr = arr.join(',');
                    StatuStr = fStr
                    SignStatus = "1";
                }
                else {

                    StatuStr = jq("#ddlSuperBillStatus").val();

                }
                var Location = "";
                if (jq("#ddlHospital").val() != "-1") {
                    Location = jq("#ddlHospital").val();
                }
                if (jq("#HdnClientType").val() == 'Biller') {
                    SignStatus = "0";
                }
                var Priority = "";
                if (jq('#ddlPriority').val() != "") {
                    Priority = jq('#ddlPriority').val();
                }

                if (jq('#ddlDateBy').val() == 'SU') {
                    SignStatus = "0";
                }

                //jq('#TblRptDetails').empty();
                jq('#TblRptDetailsDummy').empty();





                var SendObj = {};
                SendObj.LocationStr = Location;
                SendObj.StatusStr = StatuStr;
                SendObj.AttSignStatus = SignStatus;
                SendObj.BillPriority = Priority;
                SendObj.StartDate = jq('#FromDateSer').val();
                SendObj.EndDate = jq('#ToDateSer').val();
                SendObj.ByDate = jq('#ddlDateBy').val();
                jq.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "RptFrmSuperBill.aspx/BindSuperBillRptDataExp",
                    data: "{SendObj:" + JSON.stringify(SendObj) + "}",
                    //async: false,
                    dataType: "json",
                    success: function (data) {
                        var data1 = JSON.parse(data.d)
                        var strTbl = '';
                        var strTblDummy = '';
                        var TotalRec = 0;
                        if (data1.length > 0) {

                            //////////////////////////////Display Data Head
                            //strTbl += "<thead class='newtable-header'><tr>";
                            //strTbl += "<td style='width:15%;'>Patient Name</td>";
                            //strTbl += "<td style='width:15%;'>Hospital Name</td>";
                            //strTbl += "<td style='width:10%;'>Status</td>";
                            //strTbl += "<td style='width:10%;'>" + jq("#ddlDateBy option:selected").text() + "Date</td>";
                            //strTbl += "<td style='width:50%;'>CPT & ICD Details</td>";
                            //strTbl += "</tr></thead>";

                            //////////////////////////////Export Data Head
                            strTblDummy += "<thead class='newtable-header'><tr border='1'>";
                            strTblDummy += "<td><b>Patient Name</b></td>";
                            strTblDummy += "<td><b>Hospital Name</b></td>";
                            strTblDummy += "<td><b>Status</b></td>";
                            strTblDummy += "<td><b><center>CPT & ICD Details</center></b></td>";
                            //strTblDummy += "<td><table><tr><td colspan='13' width='1000px;'><b><center>CPT & ICD Details</center></b></td><td>Create Name</td><td>Create Date</td><td>Modify Name</td><td>Modify Date</td></tr></table></td>";
                            strTblDummy += "<td><b>ChartDate</b></td>";
                            strTblDummy += "<td><b>SignOffDate</b></td>";
                            strTblDummy += "<td><b> ATT Provider Name</b></td>";
                            strTblDummy += "<td><b>Insurance Name(Primary)</b></td>";
                            strTblDummy += "<td><b>Insurance Name(Secondary)</b></td>";
                            strTblDummy += "<td><b>Admit Date</b></td>";
                            strTblDummy += "<td><b>Discharge Date</b></td>";
                            strTblDummy += "<td><b>Super Bill Date</b></td>";
                            //  strTblDummy += "<td><b>Created By</b></td>";
                            strTblDummy += "<td><b>Note</b></td>";
                            strTblDummy += "<td><b>Created By</b></td>";
                            strTblDummy += "<td><b>Created Date</b></td>";
                            strTblDummy += "<td><b>Modified By</b></td>";
                            strTblDummy += "<td><b>Modified Date</b></td>";

                            strTblDummy += "</tr></thead>";

                            var TblStr = "";
                            var TblDummStr = "";
                            var chartID = "";
                            jq(data1).each(function () {

                                TblStr = "";
                                TblDummStr = "";
                                var curRecord = jq(this)[0];
                                if (chartID != curRecord.ChartID) {
                                    chartID = curRecord.ChartID;
                                    TotalRec++;

                                    //////////////////////////Display Data    
                                    //strTbl += "<tr>";
                                    //strTbl += "<td style='width:15%;' valing='top' ><inpit type='hiddne' value='" + curRecord.ChartID + "'/>" + xFormatEmpty(curRecord.PatientName) + "</td>";
                                    //strTbl += "<td style='width:15%;' valing='top'>" + xFormatEmpty(curRecord.HospitalName) + "</td>";
                                    //strTbl += "<td style='width:10%;' valing='top'>" + xFormatEmpty(curRecord.Status) + "</td>";
                                    //var ByDate = jq('#ddlDateBy').val();
                                    //if (ByDate == 'CH') {
                                    //    strTbl += "<td style='width:10%;' valing='top'>" + xFormatEmpty(curRecord.ChartDate) + "</td>";
                                    //}
                                    //if (ByDate == 'SU') {
                                    //    strTbl += "<td style='width:10%;' valing='top'>" + xFormatEmpty(curRecord.SuperBillDate) + "</td>";
                                    //}
                                    //if (ByDate == 'SI') {
                                    //    strTbl += "<td style='width:10%;' valing='top'>" + xFormatEmpty(curRecord.SuperBillDate) + "</td>";
                                    //}


                                    //////////////////////////Export Data                         

                                    strTblDummy += "<tr>";
                                    strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.PatientName) + "</td>";
                                    strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.HospitalName) + "</td>";
                                    strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.Status) + "</td>";


                                    var CrName = '';
                                    var CrDate = '';
                                    var MName = '';
                                    var MDate = '';

                                    if (xFormatEmpty(curRecord.Status) != 'SignOff') {
                                        var CPTData = data1.filter(function (obj) {
                                            return (obj.ChartID == curRecord.ChartID);
                                        });

                                        if (CPTData.length > 0) {
                                            TblStr += "<table border='0'>";
                                            TblDummStr += "<table border='1'>";

                                            //if (this.CPT != '')
                                            //{
                                            //    var CPTArry = this.CPT.split(',');
                                            //}
                                            //var cntt = 0;
                                            jq(CPTData).each(function () {


                                                CrName = '';
                                                MName = '';
                                                CrDate = '';
                                                MDate = '';
                                                //////////////////////////Display Data 

                                                if (this.CPT != '') {
                                                    TblStr += "<tr><td>" + xFormatEmpty(this.CPT) + "</td><td>" + xFormatEmpty(this.ICD1) + "</td></tr>";

                                                    // TblStr += "<tr><td>" +  CPTArry[cntt] + "</td><td>" + xFormatEmpty(this.ICD1) + "</td></tr>";

                                                }
                                                if (this.ICD2 != '') {
                                                    TblStr += "<tr><td></td><td>" + xFormatEmpty(this.ICD2) + "</td></tr>";
                                                }
                                                if (this.ICD3 != '') {
                                                    TblStr += "<tr><td></td><td>" + xFormatEmpty(this.ICD3) + "</td></tr>";
                                                }
                                                if (this.ICD4 != '') {
                                                    TblStr += "<tr><td></td><td>" + xFormatEmpty(this.ICD4) + "</td></tr>";
                                                }
                                                if (this.ICD5 != '') {
                                                    TblStr += "<tr><td></td><td>" + xFormatEmpty(this.ICD5) + "</td></tr>";
                                                }
                                                if (this.ICD6 != '') {
                                                    TblStr += "<tr><td></td><td>" + xFormatEmpty(this.ICD6) + "</td></tr>";
                                                }
                                                if (this.ICD7 != '') {
                                                    TblStr += "<tr><td></td><td>" + xFormatEmpty(this.ICD7) + "</td></tr>";
                                                }
                                                if (this.ICD8 != '') {
                                                    TblStr += "<tr><td></td><td>" + xFormatEmpty(this.ICD8) + "</td></tr>";
                                                }


                                                //////////////////////////Export Data 

                                                //alert(GetCode(this.CPT));
                                                //alert(GetCode(this.ICD2));


                                                TblDummStr += "<tr><td>" + xFormatEmpty(GetCode(this.CPT)) + "</td>";

                                                // TblDummStr += "<tr><td>" + xFormatEmpty(GetCode(CPTArry[cntt])) + "</td>";


                                                TblDummStr += "<td>" + xFormatEmpty(this.Modifier1) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.Modifier2) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.Modifier3) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.Modifier4) + "</td>";

                                                TblDummStr += "<td>" + xFormatEmpty(this.ICdCode1) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.ICdCode2) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.ICdCode3) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.ICdCode4) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.ICdCode5) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.ICdCode6) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.ICdCode7) + "</td>";
                                                TblDummStr += "<td>" + xFormatEmpty(this.ICdCode8) + "</td>";




                                                //TblDummStr += "<td>" + xFormatEmpty(this.ICdCode8) + "</td>";
                                                CrName = xFormatEmpty(this.CrName);
                                                CrDate = xFormatEmpty(this.CrDate);

                                                MName = xFormatEmpty(this.MName);
                                                MDate = xFormatEmpty(this.MDate);
                                                TblDummStr += "</tr>";


                                                //cntt++;

                                            });
                                            TblDummStr += "</table>";
                                            TblStr += "</table>";


                                            //strTbl += "<td style='width:50%;' valing='top'>" + TblStr + "</td>";
                                            strTblDummy += "<td style='width:50%;' valing='top'>" + TblDummStr + "</td>";

                                            TblStr = "";
                                            TblDummStr = "";

                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.ChartDate) + "</td>";
                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.SignOffDate) + "</td>";
                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.ATTProvName) + "</td>";
                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.Insurance1) + "</td>";
                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.Insurance2) + "</td>";
                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.AD_Admit_Date) + "</td>";
                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.AD_Discharge_Date) + "</td>";
                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.SuperBillDate) + "</td>";
                                            //  strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.CName) + "</td>";
                                            strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.Notes) + "</td>";
                                            strTblDummy += "<td valing='top'>" + CrName + "</td>";
                                            strTblDummy += "<td valing='top'>" + CrDate + "</td>";
                                            strTblDummy += "<td valing='top'>" + MName + "</td>";
                                            strTblDummy += "<td valing='top'>" + MDate + "</td>";



                                        }
                                        else {
                                            // strTbl += "<td style='width:50%;' valing='top'></td>";
                                            strTblDummy += "<td style='width:50%;' valing='top'></td>";
                                        }

                                    }
                                    else {
                                        // strTbl += "<td style='width:50%;' valing='top'></td>";
                                        strTblDummy += "<td style='width:50%;' valing='top'></td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.ChartDate) + "</td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.SignOffDate) + "</td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.ATTProvName) + "</td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.Insurance1) + "</td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.Insurance2) + "</td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.AD_Admit_Date) + "</td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.AD_Discharge_Date) + "</td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.SuperBillDate) + "</td>";
                                        //  strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.CName) + "</td>";
                                        strTblDummy += "<td valing='top'>" + xFormatEmpty(curRecord.Notes) + "</td>";
                                        strTblDummy += "<td valing='top'>" + CrName + "</td>";
                                        strTblDummy += "<td valing='top'>" + CrDate + "</td>";
                                        strTblDummy += "<td valing='top'>" + MName + "</td>";
                                        strTblDummy += "<td valing='top'>" + MDate + "</td>";



                                    }

                                    /// strTbl += "</tr>";
                                    strTblDummy += "</tr>";
                                }


                            });


                            // jq('#TblRptDetails').html(strTbl);
                            jq('#TblRptDetailsDummy').html(strTblDummy);
                            jq('#SpnRec').html(TotalRec);
                            ExporttoExel();

                        }
                        else {
                            strTbl = '<table><tr><td>No Data Found !<td></tr></table>';
                            jq('#TblRptDetails').html(strTbl);
                            jq('#SpnRec').html("");
                        }
                        BlockProcess();
                        // tableGrid();
                    }

                });
            }
            else {
                BlockProcess();
            }
        }

        function ExporttoExel() {

            if (DateValidation() == true) {
                if (jq("#TblRptDetailsDummy tr").length != 0) {


                    var tab_text = '<table  border="1" align="Center" width="100%" class="simple-table">';
                    //*****************************************************************************************   
                    var i = 0;
                    var tab = document.getElementById('TblRptDetailsDummy'); // id of table 
                    var lines = tab.rows.length;

                    // the first headline of the table
                    if (lines > 0) {
                        tab_text = tab_text + '<tr class="newtable-header">' + tab.rows[0].innerHTML + '</tr>';//tab_text +
                    }
                    // table data lines, loop starting from 1
                    for (i = 1 ; i < lines; i++) {
                        tab_text = tab_text + "<tr>" + tab.rows[i].innerHTML + "</tr>";
                    }
                    tab_text = (tab_text + "</table><br/>");
                    //***************************************************************************************** 


                    var now = new Date();
                    var year = now.getFullYear();
                    var month = now.getMonth() + 1;
                    var day = now.getDate();
                    var hour = now.getHours();
                    var minute = now.getMinutes();
                    var second = now.getSeconds();
                    var milisec = now.getMilliseconds();
                    var FormateStr = year + "" + month + "" + day + "" + hour + "" + minute + "" + second + "" + milisec;

                    var ua = window.navigator.userAgent;
                    var msie = ua.indexOf("MSIE ");
                    var FileName = "SuperBillReport_" + FormateStr;
                    DownloadFile(FileName, tab_text, ".xls");
                }
                else {
                    alert("No Data Found !");
                }

            }

        }


        // DownloadFile supported for all browsers
        function DownloadFile(fileName, csvContent, extension) {

            if (extension != ".xls") {
                csvContent = base64ToArrayBuffer(csvContent);
            }

            var D = document;
            var a = D.createElement('a');
            var strMimeType = 'application/octet-stream;charset=utf-8';
            var rawFile;

            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:10\./)) {
                var frame = D.createElement('iframe');
                document.body.appendChild(frame);

                frame.contentWindow.document.open("text/html", "replace");
                frame.contentWindow.document.write('sep=,\r\n' + csvContent);
                frame.contentWindow.document.close();
                frame.contentWindow.focus();
                frame.contentWindow.document.execCommand('SaveAs', true, fileName + extension);

                document.body.removeChild(frame);
                return true;
            }

            // IE10+
            if (navigator.msSaveBlob) {
                return navigator.msSaveBlob(new Blob(["\ufeff", csvContent], {
                    type: strMimeType
                }), fileName + extension);
            }

            //html5 A[download]
            if ('download' in a) {
                var blob = new Blob([csvContent], {
                    type: strMimeType
                });
                rawFile = URL.createObjectURL(blob);
                a.setAttribute('download', fileName + extension);
            } else {
                rawFile = 'data:' + strMimeType + ',' + encodeURIComponent(csvContent);
                a.setAttribute('target', '_blank');
                a.setAttribute('download', fileName + extension);
            }


            a.href = rawFile;
            a.setAttribute('style', 'display:none;');
            D.body.appendChild(a);
            setTimeout(function () {
                if (a.click) {
                    a.click();
                    // Workaround for Safari 5
                } else if (document.createEvent) {
                    var eventObj = document.createEvent('MouseEvents');
                    eventObj.initEvent('click', true, true);
                    a.dispatchEvent(eventObj);
                }
                D.body.removeChild(a);

            }, 100);
        }
        //

        // Start This function used when going pass byte array data to above DownloadFile function 
        function base64ToArrayBuffer(base64) {
            var binaryString = window.atob(base64);
            var binaryLen = binaryString.length;
            var bytes = new Uint8Array(binaryLen);
            for (var i = 0; i < binaryLen; i++) {
                var ascii = binaryString.charCodeAt(i);
                bytes[i] = ascii;
            }
            return bytes;
        }









    </script>
</body>
</html>
