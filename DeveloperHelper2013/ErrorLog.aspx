<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorLog.aspx.cs" Inherits="DeveloperHelper2013.Sample.ErrorLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    // ErrorHandler.methods.LogError(err);
    </div>





        <script type="text/javascript">




            /* ErrorHandler */
            var ErrorHandler = ErrorHandler || {}

            ErrorHandler.methods = {
                LogError: function (errObject) {
                    try {

                        var ErrorObj = {};
                        ErrorObj.message = errObject.message
                        ErrorObj.stack = errObject.stack
                        ErrorObj.name = errObject.name
                        ErrorObj.requestUrl = window.location.href;


                      


                        $.ajax({
                            type: "POST",
                            url: "../ErrorLog.aspx/ClientErrorTrack",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: "{ErrorObj:" + JSON.stringify(ErrorObj) + "}",
                            success: function (data, response) {
                                try {

                                } // end of try
                                catch (err) {
                                    alert(err);
                                } // end of catch
                            } // end of success block
                        });                                  // end of $.ajax
                    } catch (err) {
                        alert(err);
                    }
                    var HiderDiv = $("<div  />");
                    HiderDiv.css({
                        'position': 'absolute',
                        'z-index': '1001',
                        'top': '0%',
                        'left': '0%',
                        'width': '100%',
                        'height': '100%',
                        'background-color': 'rgb(242, 250, 253)',
                        'display': 'none'
                    });
                    var textDiv = $("<div  />");
                    textDiv.css({
                        'position': 'absolute',
                        'z-index': '2000',
                        'top': '20px',
                        'left': '30%',
                        'width': '360px',
                        'border': '1px solid #c6c6c6',
                        'height': '150px',
                        'background-color': 'rgb(242, 250, 253)',
                        'padding': '10px',
                        'border-radius': '25px',
                        '-moz-border-radius': '15px',
                        'text-align': 'center',
                        'color': '#453E3E',
                        'font-size': '14px',
                        'display': 'none'
                    });
                    textDiv.html("Error occured at this instance.");
                    var StackDiv = $("<div id='DivForErrorStack' style='display:none'/>");
                    var msgDiv = $("<div id='DivForErrorMessage' style='display:none'/>");
                    msgDiv.html(errObject.message);
                    StackDiv.html(errObject.stack);
                    textDiv.append(StackDiv);
                    textDiv.append(msgDiv);

                    $(document.body).append(HiderDiv);
                    $(document.body).append(textDiv);
                    HiderDiv.fadeIn('slow');
                    textDiv.fadeIn('slow');
                    throw errObject;
                } // end of LogError
            }//ErrorHandler.methods END


            // Function call when Catch fire from .cs file , Error handling
            function SetErrObj(data) {
                ErrObj.message = data.Message;
                ErrObj.stack = data.StackTraceString;
                ErrorHandler.methods.LogError(ErrObj);
            }












        </script>




    </form>
</body>
</html>
