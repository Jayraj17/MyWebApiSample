<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo007.aspx.cs" Inherits="DeveloperHelper2013.Demo007" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../Scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">


        var jq = jQuery.noConflict(true);

        jq(function () {
            alert("JAY");
        });

        jq(document).ready(function () {
            alert("jayraj");
            Test();
        });

        function pageLoad() {
            Test();
            alert("raj");
        }


        function Test() {
            var DataStr = "";
            for (var i = 0; i < 1000; i++) {
                DataStr += '<Employee><id>' + i + '</id><name>Test' + i + '</name><salary>100000' + i + '</salary><email>Surya' + i + '@gmail.com</email><address>ABCDATA' + i + '</address></Employee>'
            }
            debugger;
            //jq('#spn').html(DataStr);



        }

        function test55()
        {

            alert("hi bhaiyaji");
            return false;
           

        }





    </script>



</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="hdnTest" />
        <span id="spn"></span>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="test55(); return false;"/>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DeveloperConnection %>" SelectCommand="SELECT * FROM [Child]"></asp:SqlDataSource>
    </form>
</body>
</html>
