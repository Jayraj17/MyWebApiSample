<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadioButtonSaveList.aspx.cs" Inherits="DeveloperHelper2013.RadioButtonSaveList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>

            <asp:HiddenField ID="HdnChartID" runat="server" />
            <asp:HiddenField ID="HdnICD" runat="server" />

            <div id="DivQues">
            </div>
            <input id="btnSave" type="button" value="Save" onclick="SaveQuestion()" style="margin:10px;" />
            <table style="display:none;border-collapse:collapse;border-spacing:0">

                <tr>

                    <td colspan="3"></td>

                </tr>

            </table>
        </div>
    </form>
     <script src="../JavaScripts/jquery-1.9.1.js"></script>
    <script type="text/javascript">

        var jq = jQuery.noConflict(true);
        jq(document).ready(function () {
            GetQuestionList();
            GetQuestionDetails();
        });



        function GetQuestionList() {
            try {

                var ICD = jq('#<%=HdnICD.ClientID %>').val();
                jq("#DivQues").empty();
                if (HdnICD != "") {
                    // jq('#parentdiv').removeClass("DisableDiv");
                    jq.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "frmPQRSQuestions.aspx/GetQuesListByICD",
                        data: "{ICD:'" + ICD + "'}",
                        async: false,
                        dataType: "json",
                        success: function (data) {
                            var data1 = JSON.parse(data.d)
                            var strTbl = '';
                            var crCode = '';
                            strTbl += "<table class='TblQues CurStyle' width='100%' border='0' style='border-collapse:collapse;border-spacing:0'>";
                            if (data1.length > 0) {
                                jq(data1).each(function () {

                                    if (this.QuestionDesc != '' && this.QuestionDesc != null)
                                    {
                                        if (crCode != this.CriteriaNo)
                                        {
                                            strTbl += "<tr class='Head gridHeader'><th colspan='3'><b>" + this.CriteriaNo + "  &#9755;  " + this.CriteriaDesc + "</b></th></tr>";
                                        }
                                        strTbl += "<tr class='Ques' id='" + this.UniqID + "'><td class='ClsCry' id='" + this.PQRSCriteriaID + "'>" + this.QuestionDesc + "</td><td> <input class='ClsRbt' type='radio' name='Status" + this.UniqID + "' value='YES' >Y</td><td> <input class='ClsRbt' type='radio' name='Status" + this.UniqID + "' value='NO' >N <input type=hidden class='ClsHidReq' value='" + this.IsRequired + "'> </td></tr>";
                                        crCode = this.CriteriaNo;
                                    }
                                });
                                strTbl += "</table>";
                                jq("#DivQues").html(strTbl);
                            }
                        }

                    });
                }
            }
            catch (e) {
                alert(e)
            }
        }




        function GetQuestionDetails() {
            try {

                var ICD = jq('#<%=HdnICD.ClientID %>').val();
                var ChartID = jq('#<%=HdnChartID.ClientID %>').val();              
                if (HdnICD != "")
                {
                    jq.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "frmPQRSQuestions.aspx/GetQuetionDetails",
                        data: "{Chartid:'" + ChartID + "',ICD:'" + ICD + "'}",
                        async: false,
                        dataType: "json",
                        success: function (data) {
                            var data1 = JSON.parse(data.d)
                            if (data1.length > 0) {

                                var ProcTbCol = jq('.TblQues tr');
                                ProcTbCol.each(function () {
                                    var QueID = jq(this).attr('id');
                                    var cutr = jq(this);
                                    jq(data1).each(function () {
                                        var test = this.QuestionID;
                                        if (QueID == test)
                                        {                                          
                                            if (this.Answer == 'Y')
                                            {
                                                jq(cutr).find('.ClsRbt[value="YES"]').prop("checked", true);
                                            }
                                            if (this.Answer == 'N')
                                            {
                                                jq(cutr).find('.ClsRbt[value="NO"]').prop("checked", true);
                                            }
                                        }
                                    });

                                });



                            }
                        }
                    });
                }
            }
            catch (e) {
                alert(e)
            }
        }




        function SaveQuestion() {

            try {
                var ChartID = jq('#<%=HdnChartID.ClientID %>').val();
                var ICD = jq('#<%=HdnICD.ClientID %>').val();
                var ProcTbCol = jq('.TblQues tr');
                ProcTbCol.each(function () {                   
                    debugger;
                    if (jq(this).hasClass("Ques")) {

                        var QueID = jq(this).attr('id');
                        var CriID = jq(this).find('.ClsCry').attr('id');
                        var QueDes = jq(this).find('.ClsCry').html();
                        var YES = jq(this).find('.ClsRbt[value="YES"]').prop("checked");
                        var NO = jq(this).find('.ClsRbt[value="NO"]').prop("checked");
                        var IsReq = jq(this).find('.ClsHidReq').val();

                        if (IsReq == 'true' && YES == false && NO == false)
                        {
                            alert(QueDes);
                            return false;
                        }
                        else if (YES == true || NO == true) {
                            var Ans;
                            if (YES == true) {
                                Ans = 'Y'
                            }
                            if (NO == true) {
                                Ans = 'N'
                            }
                            SaveQueAns(ChartID, QueID, CriID, Ans, ICD)
                        }
                    }
                    });
                

            } catch (e) {

            }
        }
        function SaveQueAns(ChartID, QueID, CriID, Ans, ICD) {
            var SendObj = {};
            SendObj.ChartID = ChartID
            SendObj.QueID = QueID
            SendObj.CriID = CriID
            SendObj.Ans = Ans
            SendObj.ICD = ICD
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "frmPQRSQuestions.aspx/SaveQueAns",
                data: "{SendObj:" + JSON.stringify(SendObj) + "}",
                async: false,
                dataType: "json",
                success: function (r) {
                    //if (r.d != 0) {
                    //    alert(r.d);
                    //  //  GetICD();
                    //}
                    //else {
                    // alert("System ...");
                    //}

                },
                error: function (result) {
                    alert("Error...");
                }
            });

        }




    </script>
</body>
</html>
