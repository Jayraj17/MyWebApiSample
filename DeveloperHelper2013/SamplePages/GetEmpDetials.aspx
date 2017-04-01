<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetEmpDetials.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.GetEmpDetials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.9.1.js"></script>
    <style type="text/css">


          .select-drop, .select-dropbox {
            background: #fff;
            color: #777;
            border: 1px solid #ccc;
            max-height: 400px;
            overflow: auto;
        }

        .select-dropbox {
            max-height: 133px;
        }

            .select-drop li, .select-dropbox li {
                width: 100%;
                float: left;
                padding: 5px;
                border-bottom: 1px solid #ddd;
                box-sizing: border-box;
                cursor: pointer;
            }

                .select-drop li:hover, .select-dropbox li:hover {
                    background: #f9f9f9;
                }

        .custom-select .search-img, .custom-selectbox .fa-sort-desc {
            position: relative;
            top: -1px;
        }

        .select-drop li.selected, .select-dropbox li.selected {
            background: #F3F3F3;
        }

        .selectbox-input {
            border: 1px solid #ccc;
            min-height: 28px;
            box-sizing: border-box;
            padding: 5px 20px 5px 5px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>Name :- 
                </td>
                <td>
                    <input type="text" id="TxtName" />
                </td>
            </tr>
            <tr>
                <td>Salary :- 
                </td>
                <td>
                    <input type="text" id="TxtSal" />
                </td>
            </tr>
            <tr>
                <td>Department :- 
                </td>
                <td>
                    <input type="text" id="TxtDep" />
                </td>
            </tr>
            <tr>
                <td>Designation :- 
                </td>
                <td>
                    <input type="text" id="TxtDes" />
                </td>
            </tr>
            <tr>
                <td>File:- 
                </td>
                <td>
                    <input type="url" id="TxtFile" />
                </td>
            </tr>
            <tr>
                <td>User Name :- 
                </td>
                <td>
                    <input type="text" id="TxtUser" />
                </td>
            </tr>
            <tr>
                <td>Password :- 
                </td>
                <td>
                    <input type="password" id="TxtPass" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" value="Save" />
                    <input type="button" value="Clear" />

                </td>


            </tr>
        </table>
        <div>
            <table border="1" id="EmpTbl"></table>
            <br />

             <input type="text" title="Emp" runat="server" class="select-input" id="ddlEmp" data-livalue="" placeholder="Select Emp" autocomplete="off" /><span class="search-new-icon"><i class="fa fa-search"></i></span>
                <ul class="select-drop" style="display: none; overflow: auto; max-height: 200px;" id="ulEmp"></ul>

        </div>
    </form>
     <script src="../Scripts/jquery-1.9.1.js"></script>
    <script>       
        $(document).ready(function () {
            try {
                BindEMP();
            } catch (err) {
                alert(err);
            }
        });

        function BindEMP() {
            try {
                var SendObj = {};
                SendObj.Name = '';
                $.ajax({
                    type: "POST",
                    url: "GetEmpDetials.aspx/GetEmpDetails",
                    contentType: "application/json;charset=utf-8",
                    data: "{SendObj:" + JSON.stringify(SendObj) + "}",
                    dataType: "json",
                    success: function (data) {
                        var DataLst = JSON.parse(data.d);
                        $('#EmpTbl').empty();
                        var strHead = "<tr><td>EmpName</td></tr>";
                        $("#EmpTbl").append(strHead);
                        if (DataLst.length > 0) {
                            $.each(DataLst, function () {
                                var Row = $(this)[0];
                                var snglTr = "<tr><td style='width: 30%'>" + Row.EmpName + "</td></tr>";
                                $("#EmpTbl").append(snglTr);
                            });
                        }
                    }
                });
            } catch (err) {
                alert(err);
            }
        }


        $(".select-input").keyup(function (e) {
            debugger;
            var Key = "";
            var ulId = $(this).parent().find(".select-drop").attr("id");
            var selectUl = $(this).parent().find(".select-drop");
            var inputVal = $(this).val();
            if (e.keyCode != 38 && e.keyCode != 40 && e.keyCode != 13) {
                selectUl.show();
                $(selectUl).scrollTop(0);
                selectUl = $("#ddlEmp").parent().find(".select-drop");
                Key = document.getElementById('ddlEmp').value;


                jq.ajax({
                    context: this,
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "FrmMessageAdminUtility.aspx/GetAutocompeteDetails",
                    data: "",
                    async: false,
                    dataType: "json",
                    success: function (r) {
                        selectUl.children().remove();
                        var Jdata = JSON.parse(r.d);
                        if (Jdata.length > 0) {
                            jq.each(Jdata, function (i, curRecord) {
                                var disable = "";
                                if (curRecord.Flag == 1) {
                                    disable = 'disable-li';
                                }
                                if (i == 0) {
                                    selectUl.append("<li class='selected " + disable + "'  id=" + curRecord.mpt_pat_unique_key + ">" + curRecord.mpt_pat_name + "</li>");
                                }
                                else {
                                    selectUl.append("<li class='" + disable + "' id=" + curRecord.mpt_pat_unique_key + ">" + curRecord.mpt_pat_name + "</li>");
                                }
                            });
                        }

                    }
                });


            }
        });
           

    </script>
</body>
</html>
