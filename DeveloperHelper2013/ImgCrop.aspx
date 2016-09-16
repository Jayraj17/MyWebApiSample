<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImgCrop.aspx.cs" Inherits="CropImage.ImgCrop" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Crop Box</title>
    <style>
        .container {
            position: absolute;
            top: 10%;
            left: 10%;
            right: 0;
            bottom: 0;
        }

        .action {
            width: 400px;
            height: 30px;
            margin: 10px 0;
        }

        .cropped > img {
            margin-right: 10px;
        }

        .imageBox {
            position: relative;
            height: 400px;
            width: 400px;
            border: 1px solid #aaa;
            background: #fff;
            overflow: hidden;
            background-repeat: no-repeat;
            cursor: move;
        }

            .imageBox .thumbBox {
                position: absolute;
                top: 50%;
                left: 50%;
                width: 200px;
                height: 200px;
                margin-top: -100px;
                margin-left: -100px;
                box-sizing: border-box;
                border: 1px solid rgb(102, 102, 102);
                box-shadow: 0 0 0 1000px rgba(0, 0, 0, 0.5);
                background: none repeat scroll 0% 0% transparent;
            }

            .imageBox .spinner {
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                right: 0;
                text-align: center;
                line-height: 400px;
                background: rgba(0,0,0,0.7);
            }
    </style>
 
    <script src="cropbox.js"></script>

    <link href="Css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="container">
            <div class="imageBox">
                <div class="thumbBox"></div>
                <div class="spinner" style="display: none">Loading...</div>
            </div>

            <div class="action">
                <input type="file" id="file" style="float: left; width: 250px">
                <input type="button" id="btnCrop" value="Crop" style="float: right">
                <input type="button" id="btnZoomIn" value="+" style="float: right">
                <input type="button" id="btnZoomOut" value="-" style="float: right">
                <input type="hidden" name="imgCropped" id="imgCropped" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" Style="display: none" />
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            </div>
            <div class="cropped">
            </div>
        </div>
        <script src="Scripts/jquery-1.11.1.min.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                var options =
                {
                    thumbBox: '.thumbBox',
                    spinner: '.spinner',
                    imgSrc: ''
                }
                var cropper = $('.imageBox').cropbox(options);
                $('#file').on('change', function () {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        options.imgSrc = e.target.result;
                        cropper = $('.imageBox').cropbox(options);
                    }
                    reader.readAsDataURL(this.files[0]);
                    //this.files = [];
                })
                $('#btnCrop').on('click', function () {
                    debugger;
                    var img = cropper.getDataURL();
                    var imgName = document.getElementById("file").value;
                    document.getElementById("imgCropped").value = img;
                    //  $("#btnUpload").click();
                    var folder = "~/Images/"
                    var id = folder + img;
                    $('.cropped').append('<img src="' + img + '">');
                    $("body").append("<img src='" + id + "'>");

                })
                $('#btnZoomIn').on('click', function () {
                    cropper.zoomIn();
                })
                $('#btnZoomOut').on('click', function () {
                    cropper.zoomOut();
                })
            });
        </script>
    </form>
</body>
</html>
