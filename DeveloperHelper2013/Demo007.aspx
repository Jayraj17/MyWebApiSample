<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo007.aspx.cs" Inherits="DeveloperHelper2013.Demo007" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.11.1.min.js"></script>

    <script type="text/javascript">


        var jq = jQuery.noConflict(true);

        jq(function () {
            alert("JAY");
        });

        jq(document).ready(function () {
            alert("jayraj");
        });

        function pageLoad() {
            alert("raj");
        }       

      



    </script>



</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
