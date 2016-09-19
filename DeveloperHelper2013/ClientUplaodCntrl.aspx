<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientUplaodCntrl.aspx.cs" Inherits="DeveloperHelper2013.ClientUplaodCntrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div>
            <table>
                <tr>
                    <th>Name</th>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>UpladFile</th>
                    <td>
                        <input type="file" id="FileUpload1" />
                        
                    </td>
                </tr>
                <tr>
                    <th colspan="2">
                        <%--   <asp:Button ID="Button1" runat="server" Text="Save"  OnClick="InsertFile();"/>--%>
                        <input type="button" value="Add Save" onclick="InsertFile();" />
                    </th>
                </tr>
            </table>
        </div>
    </div>
    </form>
      <script src="jquery-1.11.1.min.js"></script>
    <script>
        function InsertFile() {
            debugger;
            var file = $("#FileUpload1").get(0).files[0];
            var r = new FileReader();
            r.onload = function () {
                var SendObj = {};
                SendObj.binimage = r.result;
                SendObj.name = document.getElementById("TextBox1").value;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "ClientUplaodCntrl.aspx/SaveImage",
                    data: "{SendObj:" + JSON.stringify(SendObj) + "}",
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        alert(data.d);
                    },
                    error: function (result) {
                        alert(result.d);
                    }
                });
            };
            r.readAsDataURL(file);
        }
    </script>
</body>
</html>
