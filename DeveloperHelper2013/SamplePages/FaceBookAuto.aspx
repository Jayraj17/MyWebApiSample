<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FaceBookAuto.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.FaceBookAuto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery.tokeninput.js"></script>
    <link href="../Css/token-input.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input type="radio" name="myRadio" value="USA" checked='checked' />
        USA
        <br />
        <input type="radio" name="myRadio" value="Brazil" />
        Brazil
        <br />
        <input type="text" id="TxtDemo55" name="blah" />
    </div>
    <script type="text/javascript">
        var ChkVal = '';
        $(document).ready(function () {
            try {
               ChkVal = $('input:radio[name=myRadio]:checked').val();
               Call(ChkVal);
            }
            // end of Try
            catch (err) {
                alert(err);
            } // end of catch
            //} // end of Getdata


        });
        $(':radio[name="myRadio"]').change(function () {
          //  ChkVal = $('input:radio[name=myRadio]:checked').val();
          //  Call(ChkVal);
        });

        function Call(Type) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "FaceBookAuto.aspx/GetDataS",
                data: "{Key:'',Type:'" + ChkVal + "'}",
                dataType: "json",
                success: function (data) {
                    var data1 = JSON.parse(data.d);
                    var html = '';
                    var DataFinal = new Array();
                    var obj = {};

                    $.each(data1, function () {
                        obj = new Object();
                        obj.id = this.id;
                        obj.name = this.name;
                        DataFinal.push(obj);
                    });

                    $("#TxtDemo55").tokenInput(DataFinal, "4", "Search ...", true);

                },
                error: function (result) {
                    alert("Error");
                }
            });


        }

         

    </script>
    </form>
</body>
</html>
