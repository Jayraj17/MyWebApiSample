<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditorDemo.aspx.cs" Inherits="DeveloperHelper2013.EditorDemo" validateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="ckeditor/config.js"></script>
    <script src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        try {
            // Turn off automatic editor creation first.
            CKEDITOR.disableAutoInline = true;

        } catch (err) {
            alert(err);
        }
        function Save()
        {
            debugger;
            jq("#TxtDemo").val(escapeHtml_HiddenChar(jq("#NewEditor").html()));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div id="DivEditor" style="width: 100%;"></div>
            <div style='border: 1px solid #c6c6c6; overflow-y: auto; padding: 2px 5px 2px 5px;'
                data-nusa-enabled="true" contenteditable="true" id="NewEditor">
            </div>
            <asp:TextBox ID="TxtDemo" runat="server" TextMode="MultiLine" Style="display: none;"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" OnClientClick="Save()" />

        </div>
        <script type="text/javascript">

            var jq = jQuery.noConflict(true);
            jq(document).ready(function () {
                HtmlEditorFunctionality();           

            });
        </script>
        <script type="text/javascript">
            function HtmlEditorFunctionality() {
                var ck_Medi = CKEDITOR.inline('NewEditor', {
                    enterMode: CKEDITOR.ENTER_BR,
                    extraPlugins: 'sharedspace',
                    //removePlugins: 'floatingspace,resize',
                    sharedSpaces: {
                        top: 'DivEditor'
                    }
                });
                ck_Medi.on('instanceReady', function (ev) {
                    var editor = ev.editor;
                    editor.setReadOnly(false);
                    $("#NewEditor").html($("#TxtDemo").val());
                });
            }

        </script>
    </form>
</body>
</html>
