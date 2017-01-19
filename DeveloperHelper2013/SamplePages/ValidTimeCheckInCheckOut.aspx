<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidTimeCheckInCheckOut.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.ValidTimeCheckInCheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">

        function InOutVali() {


            var ddlArrHH = document.getElementById("ddlArrHH");
            var ddlArrMM = document.getElementById("ddlArrMM");
            var ddlArrAM = document.getElementById("ddlArrAM");

            var ddlCheckHH = document.getElementById("ddlCheckHH");
            var ddlCheckMM = document.getElementById("ddlCheckMM");
            var ddlCheckAM = document.getElementById("ddlCheckAM");


            var ArrAM = document.getElementById("ddlArrAM").value == 'AM' ? 1 : 2;
            var CheckAM = document.getElementById("ddlCheckAM").value == 'AM' ? 1 : 2;


            ValidStartTimeEndTime(ddlArrHH.value, ddlArrMM.value, ArrAM, ddlCheckHH.value, ddlCheckMM.value, CheckAM);

        }



        function ValidStartTimeEndTime(StartHH, StartMM, StartAM, EndHH, EndMM, EndAM) {

            if ((Number(StartAM) == Number(EndAM))) {

                if (EndHH == "12" && EndAM == 2) {
                    alert("Not Valid Time");
                    return false;
                }

                if (EndHH != "12") {

                    if (Number(StartHH) > Number(EndHH)) {
                        alert("Not Allow To Hours");
                        return false;
                    }
                }

                if (Number(StartHH) == Number(EndHH)) {

                    if ((Number(StartMM) <= Number(EndMM)) || (Number(EndMM) == Number(StartMM))) {
                        return true;
                    }
                    else {
                        alert("Not Allow Min");
                        return false;
                    }
                }
                if (Number(StartHH) < Number(EndHH)) {
                    return true;
                }
            }
            else if (Number(StartAM) < Number(EndAM)) {
                return true;
            }
            else {
                alert("Not Allow Time");
                return false;
            }
        }

        function Test() {

            var split = '10:15:AM'.split(':');

            var HH = split[0];
            var MM = split[1];
            var AM = split[2];

            alert(HH.value);
            alert(MM);
            alert(AM);
            return false;

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="line-height: 2; border: solid 1px #7ec6e1;">
            <tr>
                <td>
                    <table id="TblArrival" runat="server">
                        <tr>
                            <td colspan="3">Arrival Time
                            <asp:CheckBox ID="ChkArr" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlArrHH" runat="server" Width="40px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlArrMM" runat="server" Width="40px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlArrAM" runat="server" Width="45px">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table id="TblCheckIn" runat="server">
                        <tr>
                            <td colspan="3">CheckIn Time
                            <asp:CheckBox ID="ChkChkIn" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlCheckHH" runat="server" Width="40px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCheckMM" runat="server" Width="40px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCheckAM" runat="server" Width="45px">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table id="TblOut" runat="server">
                        <tr>
                            <td colspan="3">CheckOut Time
                            <asp:CheckBox ID="ChkOut" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlOutHH" runat="server" Width="40px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOutMM" runat="server" Width="40px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOutAM" runat="server" Width="45px">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="return InOutVali();" />
                    <asp:Button ID="Button2" runat="server" Text="MyTest" OnClientClick="return Test();" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
