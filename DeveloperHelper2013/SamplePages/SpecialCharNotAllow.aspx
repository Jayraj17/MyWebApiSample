<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialCharNotAllow.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.SpecialCharNotAllow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script type="text/javascript">

        function valid(f) {
            !(/^[A-z&#209;&#241;0-9]*$/i).test(f.value) ? f.value = f.value.replace(/[^A-z&#209;&#241;0-9]/ig, '') : null;
        }

        $(function () {

            $('#TextBox1').keyup(function () {
                var yourInput = $(this).val();
                re = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
                var isSplChar = re.test(yourInput);
                if (isSplChar) {
                    var no_spl_char = yourInput.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');
                    $(this).val(no_spl_char);
                }
            });

        });
    </script>
    <script type="text/javascript">

        function alpha(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
        }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input name="mytext" type="text" onkeyup="valid(this)" onblur="valid(this)">
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtNewAllergy" runat="server" Width="180" onkeypress="return alpha(event)"
            onblur="return alpha(event)" onpaste="return false;" MaxLength="50"></asp:TextBox>
    </div>
    </form>
</body>
</html>
