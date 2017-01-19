<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaxChar.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.MaxChar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function ValidateLimitMax(obj, maxchar) {
            if (this.id) obj = this;
            var remaningChar = maxchar - obj.value.length;
            if (remaningChar <= 0) {
                obj.value = obj.value.substring(maxchar, 0);
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" onkeyup="ValidateLimit(this,20);" onpaste="ValidateLimit(this,20);">   </asp:TextBox>
            <br />
            Remaining char:
        <asp:Label ID="Label1" runat="server" Text="20"></asp:Label>
        </div>
    </form>
</body>
</html>
