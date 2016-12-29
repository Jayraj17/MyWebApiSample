<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password.aspx.cs" Inherits="DeveloperHelper2013.Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    

           <div class="form-group has-success has-feedback">
                                <label>Password:</label>
                                <input type="password" class="form-control" placeholder="Password" id="txtPassword" />
                                 <span id="spnPassword" class="glyphicon glyphicon-eye-open cursor-pointer form-control-feedback" title="Show Password" style="pointer-events: all;"></span>
                                <div id="PwdDetails" class="passverify" style="display: none; font-size: 12px;">
                                    <ul style="list-style-type: none; padding: 0;">
                                        <li id="length" class="invalid"><i class="glyphicon glyphicon-remove-circle"></i>Have at least <strong>5 characters</strong></li>
                                        <li id="lengthMax" class="invalid"><i class="glyphicon glyphicon-remove-circle"></i>Have maximum <strong>15 characters</strong></li>
                                        <li id="number" class="invalid"><i class="glyphicon glyphicon-remove-circle"></i>Have at least <strong>one number</strong></li>
                                        <li id="Special" class="invalid"><i class="glyphicon glyphicon-remove-circle"></i>Have at least One <strong>Special character </strong></li>
                                    </ul>
                                </div>
                            </div>


        <script>


            
       $(document).ready(function () {
           $('#txtPassword').popover({
               trigger: 'focus',
               placement: 'right',
               html: true,
               width: 500,
               container: 'body',
               content: function () {
                   var message = $("#PwdDetails").html();
                   return message;
               }
           });
           BindUserMaster();
           BindRoleMaster();

       });
            $('#txtPassword').keyup(function () {
                try {
                    CheckPwd($("#txtPassword").val());
                    var id = $(this).attr("aria-describedby");
                    $("#" + id).find(".popover-content").html($("#PwdDetails").html());
                } catch (err) {
                    alert(err);
                }
            });      
            $('#spnPassword').click(function () {           
                var $pwd = $("#txtPassword");
                if ($pwd.attr('type') === 'password') {
                    $pwd.attr('type', 'text');
                    $(this).addClass("glyphicon-eye-close");             
                } else {
                    $pwd.attr('type', 'password');
                    $(this).removeClass("glyphicon-eye-close");
                    $(this).addClass("glyphicon-eye-open");              
                }
            });









            function JS_CheckPwd(pswd) {
                try {

                    var regExPass = /(?=^.{0,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?=.*\W.*)(?!.*\s).*$/g;
                    if (isNaN(regExPass)) {
                        //validate Minimum length
                        if (pswd.length >= 5) {
                            $('#length').removeClass('invalid').addClass('valid');
                            $('#length i').removeClass('glyphicon-remove-circle').addClass('glyphicon-ok-circle');
                        } else {
                            $('#length').removeClass('valid').addClass('invalid');
                            $('#length i').removeClass('glyphicon-ok-circle').addClass('glyphicon-remove-circle');
                        }
                        //validate Maximum length
                        if (pswd.length > 0 && pswd.length <= 15) {
                            $('#lengthMax').removeClass('invalid').addClass('valid');
                            $('#lengthMax i').removeClass('glyphicon-remove-circle').addClass('glyphicon-ok-circle');
                        } else {
                            $('#lengthMax').removeClass('valid').addClass('invalid');
                            $('#lengthMax i').removeClass('glyphicon-ok-circle').addClass('glyphicon-remove-circle');
                        }
                        //validate number
                        if (pswd.match(/\d+/)) {
                            $('#number').removeClass('invalid').addClass('valid');
                            $('#number i').removeClass('glyphicon-remove-circle').addClass('glyphicon-ok-circle');
                        } else {
                            $('#number').removeClass('valid').addClass('invalid');
                            $('#number i').removeClass('glyphicon-ok-circle').addClass('glyphicon-remove-circle');
                        }
                        var Special_Char = /[!@#$%^&*()_+}{:;'?/><,]/g;
                        if (isNaN(pswd)) {
                            if (pswd.match(Special_Char)) {
                                $('#Special').removeClass('invalid').addClass('valid');
                                $('#Special i').removeClass('glyphicon-remove-circle').addClass('glyphicon-ok-circle');
                            }
                            else {
                                $('#Special').removeClass('valid').addClass('invalid');
                                $('#Special i').removeClass('glyphicon-ok-circle').addClass('glyphicon-remove-circle');
                            }
                        }
                        else {
                            $('#Special').removeClass('valid').addClass('invalid');
                            $('#Special i').removeClass('glyphicon-ok-circle').addClass('glyphicon-remove-circle');
                        }
                    }
                } catch (err) {
                    alert(err);
                }
            }


        </script>


    </form>
</body>
</html>
