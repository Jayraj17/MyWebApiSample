<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ValidationAllowNumber.aspx.cs" Inherits="DeveloperHelper2013.ValidationAllowNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <style type="text/css">


        .test {

            background-color:red;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <table>
                <tr>
                    <td><strong>Int value:</strong></td>
                    <td>
                        <input type="text" name="numeric" class='allow_numeric'>
                        <div>Allow only numeric values (without decimal) </div>
                    </td>
                </tr>
                <tr>
                    <td><strong>Decimal :</strong></td>
                    <td>
                        <input type="text" name="numeric" class='test allow_decimaleee'>
                        <input type="text" name="numeric1" class='allow_decimal'>
                        <div>Allow numeric values with decimal</div>
                    </td>
                </tr>
            </table>


            <script>
                $(document).ready(function () {
                    test();

                    $(".allow_numeric").on("input", function (evt) {
                        var self = $(this);
                        self.val(self.val().replace(/[^\d].+/, ""));
                        if ((evt.which < 48 || evt.which > 57)) {
                            evt.preventDefault();
                        }
                    });

                    $(".allow_decimal").on("input", function (evt) {
                        var self = $(this);
                        self.val(self.val().replace(/[^0-9\.]/g, ''));
                        if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
                            evt.preventDefault();
                        }
                    });

                });



                function test()
                {

                    $(".allow_decimaleee").on("input", function (evt) {
                        var self = $(this);
                        self.val(self.val().replace(/[^0-9\.]/g, ''));
                        if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
                            evt.preventDefault();
                        }
                    });

                }
            </script>


        </div>
    </form>
</body>
</html>
