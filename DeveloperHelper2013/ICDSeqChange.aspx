<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ICDSeqChange.aspx.cs" Inherits="DeveloperHelper2013.ICDSeqChange" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<%--<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js" type="text/javascript"></script>--%>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>


    <script src="Scripts/jquery-1.9.1.js"></script>

   


    <style type="text/css">
        .draggable {
            background: #fff;
            padding-bottom: 5px;
            padding-top: 5px;
            padding-right: 0px;
            padding-left: 0px;
            cursor: move;
            border: #000 1px solid;
            text-align: center;
            font-weight: bold;
        }

        .droppable {
            width: 350px;
            background-color: gray;
            list-style: none;
            margin: 0;
            padding: 10px;
            height: 500px;
        }
    </style>
    <script>
       



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="divMain">
                <div id="divOuter1666" class="droppable">
                    <%--<div id="div1" class="draggable">
                        001-Test001
                    </div>
                    <div id="div2" class="draggable">
                        002-Test002
                    </div>
                    <div id="div3" class="draggable">
                        003-Test003
                    </div>--%>
                </div>


                <ul id="divOuter1" class="droppable">
                </ul>

            </div>

        </div>







       














    </form>
     
    <script type="text/javascript">

        var jq = jQuery.noConflict(true);
        jq(document).ready(function () {
            GetICD();

            jq('#divOuter2').css("margin", "-540px 0 0 400px");
            jq('#divOuter3').css("margin", "-540px 0 0 800px");

            jq(".droppable").sortable({
                update: function (event, ui) {
                    Dropped();
                }
            });


        });

        function Dropped(event, ui) {
            var Seq = 1;
            jq(".draggable").each(function () {
                debugger;
                //var p = $(this).position();
                //  alert(jq(this).attr('id') + " " + Seq);
                ChangeICDSeq(jq(this).attr('id'), Seq);
                Seq++;
            });
            refresh();
        }

        function GetICD() {
            try {

                jq.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "ICDSeqChange.aspx/GetICDa",
                    data: "{}",
                    dataType: "json",
                    success: function (data1) {
                        var data = JSON.parse(data1.d);
                        jq("#divOuter1").html('');
                        if (data.length != 0) {
                            jq.each(data, function () {
                                //jq("#divOuter1").append("<div class='draggable' id=" + this.ICD + ">" + this.ICD + "-" + this.Description + "</div>");
                                jq("#divOuter1").append("<li class='draggable' id=" + this.ICD + ">" + this.ICD + "-" + this.Description + "</li>");
                            });
                        }
                    }
                });

            }
            catch (e) {

                alert(e);
            }
        }



        function ChangeICDSeq(objICD, objSeq) {
            var SendObj = {};
            debugger;
            SendObj.ICD = objICD
            SendObj.Seq = objSeq
            jq.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "ICDSeqChange.aspx/ChangeSeq",
                data: "{SendObj:" + JSON.stringify(SendObj) + "}",
                async: false,
                dataType: "json",
                success: function (r) {
                    //if (r.d != 0) {
                    //    alert(r.d);
                    //  //  GetICD();
                    //}
                    //else {
                    // alert("System ...");
                    //}

                },
                error: function (result) {
                    alert("Error...");
                }
            });
        }
    </script>
</body>
</html>
