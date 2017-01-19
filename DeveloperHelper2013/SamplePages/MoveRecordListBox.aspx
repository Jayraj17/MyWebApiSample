<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveRecordListBox.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.MoveRecordListBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">

        function listboxMoveRecord(listID, direction) {

            var listbox = document.getElementById(listID);
            var selIndex = listbox.selectedIndex;


            //alert(listbox.value);

            if (-1 == selIndex) {
                alert("Please select an option to move.");
                return;
            }
            var increment = -1;
            if (direction == 'up')
                increment = -1;
            else
                increment = 1;

            if ((selIndex + increment) < 0 || (selIndex + increment) > (listbox.options.length - 1)) {
                return;
            }

            var selValue = listbox.options[selIndex].value;
            var selText = listbox.options[selIndex].text;

            listbox.options[selIndex].value = listbox.options[selIndex + increment].value
            listbox.options[selIndex].text = listbox.options[selIndex + increment].text
            listbox.options[selIndex + increment].value = selValue;
            listbox.options[selIndex + increment].text = selText;
            listbox.selectedIndex = selIndex + increment;
            //  alert(listbox.selectedIndex);


        }

        function SetStr() {

            var list = document.getElementById('LstBox');
            var HdnID = document.getElementById('<%=HdnID.ClientID %>');
            var str33 = "";
            for (var i = 0; i < list.options.length; ++i) {
                str33 = str33 + ',' + list.options[i].value;
            }
            HdnID.value = str33;


        }






    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:HiddenField ID="HdnID" runat="server" />
                        <asp:ListBox ID="LstBox" runat="server" Height="150px"></asp:ListBox>
                    </td>
                    <td align="center">
                        <img alt="" src="../Images/UpP.png" height="20px" width="20px" onclick="listboxMoveRecord('LstBox', 'up')" />
                        <br />
                        <br />
                        <img alt="" src="../Images/DownP.png" height="20px" width="20px" onclick="listboxMoveRecord('LstBox', 'down')" />
                    </td>
                </tr>
            </table>
            <%-- <br />
        <br />
        Move <a href="#" onclick="listboxMoveRecord('LstBox', 'up')">up</a>, <a href="#"
            onclick="listboxMoveRecord('LstBox', 'down')">down</a>


            --%>
            <%--  <br />--%>
        </div>
        <asp:Button ID="test" runat="server" Text="Done" OnClientClick="SetStr()" OnClick="test_Click" />
    </form>
</body>
</html>
