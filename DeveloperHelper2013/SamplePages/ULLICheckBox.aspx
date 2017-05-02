<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ULLICheckBox.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.ULLICheckBox" %>

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



        function FullQualityofcare() {
            $.ajax({
                type: "POST",
                url: "frmChartMU2New.aspx/GetQualityOfCare",
                contentType: "application/json;charset=utf-8",
                data: "{}",
                async: false,
                dataType: "json",
                success: function (response) {
                    try {

                        var MData = JSON.parse(response.d);
                        if (MData != '') {
                            $("#DivQuelityOfCare").show();
                            $("#DivQuelityOfCare").empty();
                            var strTbl = "";
                            strTbl += '<div class="Addenhead">Quality Of Care</div>';
                            strTbl += '<ul class="ChkLst">';
                            var Head = "";
                            $.each(MData, function () {
                                strTbl += "<li class='lichek'> <input class='ChkVal' id=" + this.QC_UniqID + " type='checkbox' name=" + this.QC_QualityofCareDesc + ">  " + this.QC_QualityofCareDesc + " </li>";

                            });
                            strTbl += '</ul>';
                            $("#DivQuelityOfCare").html(strTbl);
                        }

                    }
                    catch (err) {
                        ErrorHandler.methods.LogError(err);
                    }
                }
            });

        }


        function BindQualityofcare(ChartID) {

            $.ajax({
                type: "POST",
                url: "frmChartMU2New.aspx/BindQualityOfCare",
                contentType: "application/json;charset=utf-8",
                data: "{ChartID:'" + ChartID + "'}",
                async: false,
                dataType: "json",
                success: function (response) {
                    try {

                        var MData = JSON.parse(response.d);
                        if (MData != '') {
                            var Head = "";
                            $('.ChkLst li').each(function () {
                                debugger;
                                var ID = $(this).closest('li').find('.ChkVal').attr('id');
                                var cur = $(this);
                                $.each(MData, function () {
                                    if (this.QCT_QualityOfCareID == ID) {
                                        $(cur).find('.ChkVal').prop("checked", true);
                                    }
                                });
                            });
                        }

                    }
                    catch (err) {
                        ErrorHandler.methods.LogError(err);
                    }
                }
            });

        }


        $("body").on("click", ".ChkVal", function () {
            var ChartID = $("#Hdn_Chart_ID").val();
            var CarID = $(this).attr('id');
            //alert($(this).is(":checked"));
            if ($(this).is(":checked") == false) {
                SaveUpdateQuality(ChartID, CarID, 0);
            }
            else {
                SaveUpdateQuality(ChartID, CarID, 1);
            }
        });


        function SaveUpdateQuality(ChartID, CareID, Mode) {
            debugger;
            var SendObj = {};
            SendObj.Mode = Mode
            SendObj.ChartID = ChartID
            SendObj.CareID = CareID
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "frmChartMU2New.aspx/SaveUpdateQualityofCare",
                data: "{SendObj:" + JSON.stringify(SendObj) + "}",
                async: false,
                dataType: "json",
                success: function (r) {
                    if (r.d != 0) {
                        //alert(r.d);   

                    }
                    else {
                        //  alert("System Error...");
                    }
                },
            });
        }





    </script>
</body>
</html>
