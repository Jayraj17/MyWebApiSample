<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetEmpDetials.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.GetEmpDetials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.9.1.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <table border="1" id="EmpTbl"></table>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            try {
                BindEMP();
            } catch (err) {
                alert(err);
            }
        });

        function BindEMP() {
            try {
                var SendObj = {};
                SendObj.Name= '';
                $.ajax({
                    type: "POST",
                    url: "GetEmpDetials.aspx/GetEmpDetails",
                    contentType: "application/json;charset=utf-8",                   
                    data: "{SendObj:" + JSON.stringify(SendObj) + "}",
                    dataType: "json",
                    success: function (data) {
                        var DataLst = JSON.parse(data.d);
                        $('#EmpTbl').empty();
                        var strHead = "<tr><td>EmpName</td></tr>";
                        $("#EmpTbl").append(strHead);
                        if (DataLst.length > 0) {
                            $.each(DataLst, function () {
                                var Row = $(this)[0];
                                var snglTr = "<tr><td style='width: 30%'>" + Row.EmpName + "</td></tr>";
                                $("#EmpTbl").append(snglTr);
                            });
                        }
                    }
                });
            } catch (err) {
                alert(err);
            }
        }

    </script>
</body>
</html>
