<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonValidation.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.CommonValidation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">





        ////////////////////////////////////////////////////////Get Days FromDate To ToDate Start




        function GetDays(FromDt, ToDt) {
            var Res = 0;
            if ((FromDt != '' || FromDt != null) && (ToDt != '' || ToDt != null)) {
                var startdate = new Date(FromDt.toLocaleString().split("/")[0] + "/" + FromDt.toLocaleString().split("/")[1] + "/" + FromDt.toLocaleString().split("/")[2]);
                var enddate = new Date(ToDt.split("/")[0] + "/" + ToDt.split("/")[1] + "/" + ToDt.split("/")[2]);
                Res = startdate.DaysBetween(enddate);

            }
            return Res;

        }
        Date.prototype.DaysBetween = function () {
            var intMilDay = 24 * 60 * 60 * 1000;
            var intMilDif = arguments[0] - this;
            var intDays = Math.floor(intMilDif / intMilDay);
            if (intDays.toLocaleString() == "NaN") {
                return 0;
            }
            else {
                return intDays + 1;
            }
        }
        ////////////////////////////////////////////////////////Get Days FromDate To ToDate END



    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
