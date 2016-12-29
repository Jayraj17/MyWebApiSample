<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ICDSeqChange001.aspx.cs" Inherits="DeveloperHelper2013.ICDSeqChange001" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
  


    <script>
        $(function () {
            $("#sortable").sortable({
                placeholder: "TestCls",
                update: function (event, ui) {
                Dropped();
            }
            });
        });


        function Dropped(event, ui) {
            alert("hi");
            var Seq = 1;
            $(".TestCls").each(function () {
                debugger;
                //var p = $(this).position();
                alert($(this).attr('id') + " " + Seq);
               // ChangeICDSeq(jq(this).attr('id'), Seq);
                Seq++;
            });
            refresh();
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul id="sortable">
                <li class="TestCls">Item 1</li>
                <li class="TestCls">Item 2</li>
                <li class="TestCls">Item 3</li>
                <li class="TestCls">Item 4</li>
                <li class="TestCls">Item 5</li>
                <li class="TestCls">Item 6</li>
                <li class="TestCls">Item 7</li>
            </ul>
        </div>
    </form>
</body>
</html>
