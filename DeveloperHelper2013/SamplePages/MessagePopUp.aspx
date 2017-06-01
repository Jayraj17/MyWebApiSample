<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessagePopUp.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.MessagePopUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.9.1.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <script>


                var jq = jQuery.noConflict(true);
                jq(document).ready(function () {                   
                    filepopup("jq","demo",'S');
                });

                function filepopup(jq, msg, sign) {
                    var IconStr = "";
                    if (sign == 'S') {
                        IconStr = "<p class='big-icon'><i class='fa fa-check-circle-o'></i></p>";
                    }
                    if (sign == 'C') {
                        IconStr = "<p class='big-icon'><i class='fa fa-times-circle-o'  style='color:red'></i></p>";
                    }
                    if (sign == 'W') {
                        IconStr = "<p class='big-icon'><i class='fa fa-exclamation-triangle'  style='color:#ceb433'></i></p>";
                    }


                    var abc = "<div class='alert-msg-bag save-alert' style='display:none;top:0;z-index:500' id='divAlert'>" +
                              "<div class='alert-msg-container' style='width: 30%; position: absolute; top: 50%; left: 35%; right: 35%'>" +
                              "<div class='alert-msg-content'>" + IconStr +
                              "<p class='alert-msg-text'>" + msg + "</p>" +
                              "</div></div></div>";
                    jq("body").append(abc);

                    jq("body").find("#divAlert").fadeIn();
                    setTimeout(function () {
                        jq("body").find("#divAlert").fadeOut("slow", function () {
                            jq("#divAlert").remove();
                        });
                    }, 3000);
                }
            </script>

        </div>
    </form>
</body>
</html>
