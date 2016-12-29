<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutoComplete.aspx.cs" Inherits="DeveloperHelper2013.AutoComplete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>

        <asp:HiddenField ID="HdnChartID" runat="server" />
        <asp:HiddenField ID="HdnPOS" runat="server" />
        <asp:HiddenField ID="HdnAttPrvId" runat="server" />
        <asp:HiddenField ID="HdnCPID" runat="server" />
        <asp:HiddenField ID="HdnPatID" runat="server" />
        <asp:HiddenField ID="HdnPOSName" runat="server" />
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:HiddenField ID="HdnSBUniqID" runat="server" />
        <asp:HiddenField ID="HdnFromMenu" runat="server" />
        <asp:HiddenField ID="HdnChartDate" runat="server" />
        <asp:HiddenField ID="hdnClientID_Session" runat="server" ClientIDMode="Static" />

        <div class="superbill-container">
            <div class="superbill-container-content">
                <div class="ready-bill-outer">
                    <div class="ready-to-bill">
                        <div class="ready-to-bill-content">
                            <div style="float: right; position: absolute; right: 0px; z-index: 1; top: 120px;">
                                <span class="left-toggle-icon" id="Chart_Dock_Pin" title="Chart List">
                                    <span class="left-triangle"></span>
                                    <span class="three-dot-icon">
                                        <span><i class="fa fa-square"></i><i class="fa fa-square"></i></span>
                                        <span><i class="fa fa-square"></i><i class="fa fa-square"></i></span>
                                        <span><i class="fa fa-square"></i><i class="fa fa-square"></i></span>
                                    </span>
                                    <span class="right-triangle"></span>
                                </span>
                            </div>
                            <ul id="Ul_Ready_To_Bill">
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="rdy-bill-status">
                    <div id="tabs" style="border: none; padding: 0;">
                        <ul>
                            <li id="li_tab_chart" class="col-6"><a href="#tabs-1" id="tab_chart" title="">Chart List</a></li>
                            <li id="li_tab_pat_doc" class="col-6"><a href="#tabs-2" id="tab_pat_doc" title="">Patient Docs.</a></li>
                        </ul>
                        <div class="tab-outer">
                            <div id="tabs-1" class="Tab_Div">
                                <ul class="tab-content refille-content" id="Ul_Chart_List">
                                </ul>
                            </div>
                            <div id="tabs-2" class="Tab_Div">
                                <div class="tab-content">
                                    <div class="tree-menu">
                                        <div class="tree" id="DivMenu">
                                            <ul id="Ul_Pat_Doc" style="padding-left: 8px;">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <input type="hidden" id="hfSBUID" class="ClsHdnSBUID" />
                <div class="chart-doc">
                    <div id="Div_Chart_Or_Doc_Preview" style="height: 100%;">
                        <iframe id="ifrm_common" src="" style="width: 100%; height: 100%; border: 0px solid White;"></iframe>
                        <div id="divImpCCD" style="display: none;" class="ccd">
                        </div>
                    </div>
                </div>
                <div class="superbill">
                    <div class="superbill-outer" style="display: none">
                        <div class="superbill-content">
                            <div class="superbill-content-1">
                                <div class="input-group">
                                    <label style="width: 70px">
                                        Status 
                                    </label>
                                    <select id="ddlStatus">
                                        <option value="Draft" selected="selected">Draft</option>
                                        <option value="Archive">Archive</option>
                                        <option value="Ready to Bill">Ready to Bill</option>
                                    </select>
                                </div>
                                <div class="input-group">




                                    <label style="width: 70px">
                                        CPT
                                    </label>
                                    <label style="width: auto">
                                        <input type="radio" name="rdbtnCPT" checked="checked" value="OfficeCPT" />
                                        Office CPT 
                                    </label>
                                    <label style="width: auto">
                                        <input type="radio" name="rdbtnCPT" value="Master" />
                                        Master
                                    </label>
                                    <div class="search-new">


                                        <input type="text" id="txtCPTList" name="txtCPTList" runat="server"
                                            class="ui-autocomplete-input" />


                                        <span class="search-new-icon"><i class="fa fa-search"></i></span>
                                    </div>
                                </div>
                                <table class="CurStyle" style="width: 100%; border-spacing: 0; border-collapse: collapse">
                                    <%--<tr class="gridHeader">
                                        <th style="width: 90%">Test Name</th>
                                        <th style="width: 10%">&nbsp;</th>
                                    </tr>--%>
                                    <tr>
                                        <td colspan="2" style="padding: 0;">
                                            <table id="TblCPT" style="width: 100%; border-spacing: 0; border-collapse: collapse">
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="superbill-content-1">

                                <div class="input-group">
                                    <label style="width: 70px">
                                        Modifier
                                    </label>
                                    <div class="search-new">
                                        <input type="text" id="txtModiList" name="txtModiList" runat="server"
                                            class="ui-autocomplete-input" />
                                        <span class="search-new-icon"><i class="fa fa-search"></i></span>
                                    </div>
                                </div>
                                <table class="CurStyle" style="width: 100%; border-spacing: 0; border-collapse: collapse">
                                    <%-- <tr class="gridHeader">
                                        <th style="width: 90%">Test Name</th>
                                        <th style="width: 10%">&nbsp;</th>
                                    </tr>--%>
                                    <tr>
                                        <td colspan="2" style="padding: 0;">
                                            <table id="TblModi" style="width: 100%; border-spacing: 0; border-collapse: collapse">
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="superbill-content-2">
                                <div class="input-group">
                                    <label style="width: 70px">
                                        ICD
                                    </label>
                                    <label style="width: auto">
                                        <input type="radio" name="rdbtnICD" class="ClsrbtnICD" checked="checked" value="Patient" />
                                        Patient 
                                    </label>
                                    <label style="width: auto">
                                        <input type="radio" name="rdbtnICD" class="ClsrbtnICD" value="Master" />Master
                                        
                                    </label>
                                    <div class="search-new">

                                        <input type="text" id="txtICDList" name="txtICDList" runat="server" class="ui-autocomplete-input" />
                                        <span class="search-new-icon"><i class="fa fa-search"></i></span>
                                    </div>
                                </div>
                                <table class="CurStyle" style="width: 100%; border-spacing: 0; border-collapse: collapse">
                                    <%--  <tr class="gridHeader">
                                        <th style="width: 90%">Test Name</th>
                                        <th style="width: 10%">&nbsp;</th>
                                    </tr>--%>
                                    <tr>
                                        <td colspan="2" style="padding: 0;">
                                            <table id="TblICD" style="width: 100%; border-spacing: 0; border-collapse: collapse">
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <div class="input-group" style="width: 50%">
                                    <label style="width: auto">Date Start</label>


                                    <input type="text" id="startDate" class="TxtDt ClsSDt" onkeyup="return false;" onkeypress="retun false;"
                                        onpaste="return false;" />
                                </div>
                                <div class="input-group" style="width: 50%">
                                    <label style="width: auto">Date End</label>

                                    <input type="text" id="endDate" class="TxtDt ClsEDt" onkeyup="return false;" onkeypress="retun false;"
                                        onpaste="return false;" />
                                </div>
                                <div class="input-group" style="width: 50%">
                                    <label style="width: 65px">Qty</label>
                                    <input type="text" id="TxtQty" class="OnlyDigit ClsQTY" style="width: 15%; margin-right: 10px;" maxlength="3" />
                                    <%-- <select id="ddlUnits" style="width: auto" class="ClsUNT">
                                        <option>Units</option>
                                        <option>Min</option>
                                    </select>--%>


                                    <select id="ddlUnits" style="width: auto" class="ClsUNT">
                                        <option value="Units">Units</option>
                                        <option value="Min">Min</option>
                                    </select>

                                </div>
                                <div class="input-group" style="width: 50%">
                                    <label style="width: 60px">Rate</label>

                                    <input type="text" id="TxtRate" style="width: 50%" class="OnlyDigit ClsRT" maxlength="3" />
                                </div>
                                <div class="form-field">
                                    <div class="input-group" style="width: 50%">
                                        <label>
                                            Bill Provider
                                        </label>
                                        <asp:TextBox runat="server" ID="txtattprv" Enabled="false" Style="width: 98%;" />
                                    </div>
                                    <div class="input-group" style="width: 50%">
                                        <label>
                                            Place Of Service
                                        </label>
                                        <asp:TextBox runat="server" ID="txtPOS" Enabled="false" Style="width: 98%;" />
                                    </div>
                                </div>
                                <div class="form-field">
                                    <div class="input-group" style="width: 50%">
                                        <label>
                                            Prior Authorise Number
                                        </label>
                                        <input type="text" id="TxtAuthoNo" style="width: 98%;" />
                                    </div>
                                    <%-- <div class="input-group" style="width: 50%">
                                        <label>
                                            Balance
                                        </label>
                                        <input type="text" style="width: 98%;" />
                                    </div>--%>
                                </div>
                                <div class="input-group">
                                    <label>
                                        Other Provider
                                    </label>
                                    <select id="ddlPro" onchange="SelectGet(this);">
                                        <option value="0" selected="selected">None</option>
                                        <option value="DK">DK - Ordering provider</option>
                                        <option value="DN">DN - Referring provider</option>
                                        <option value="DQ">DQ - Supervising provider</option>
                                    </select>
                                </div>
                                <div class="input-group">
                                    <table id="TblPro" cellspacing="0" style="display: none;">
                                        <tr>
                                            <td>
                                                <span id="SpanFname"></span>
                                            </td>
                                            <td>
                                                <span id="SpanLname"></span>
                                            </td>
                                            <td>
                                                <span id="SpanNPI"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="text" id="TxtFname" class="Prov" style="width: 100px;" />
                                            </td>
                                            <td>
                                                <input type="text" id="TxtLname" class="Prov" style="width: 100px;" />
                                            </td>
                                            <td>
                                                <input type="text" id="TxtNPI" class="OnlyDigit Prov" style="width: 100px;" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="input-group">
                                    <label>
                                        Note
                                    </label>
                                    <textarea id="TxtNote" style="width: 99%" rows="5" cols="5"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="superbill-content-footer">
                            <input type="button" value="Save" class="button" id="spSavee" onclick="SaveSBill(this)" />
                            <input type="button" value="Cancel" class="button" id="spCancel" />
                            <%-- <input type="button" value="Clear" class="button" onclick="ClearSB();" />--%>
                            <%--<input type="button" value="Edit" class="button" onclick="GetSuperBillRecordByUniqID();" />--%>
                        </div>
                    </div>
                    <div class="superbill-details accordion">
                        <span class="add-superbill">
                            <input type="button" class="button" value="Add New" id="addNewSuperbill" /></span>
                        <div id="DivSuperDis">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="div_print_loader" class="wait_img">
            <img src="../App_Themes/NewTheme/images/wait2_new_50.gif" alt="" />
        </div>
    </form>

     <script src="../JavaScripts/jquery-1.9.1.js"></script>


    <script src="../JavaScripts/jquery-ui-datepicker.js" type="text/javascript"></script>
    <script src="../JavaScripts/jquery-HL.js?vrsn=<%=ConfigurationManager.AppSettings["PrintJSVersionNumber"]%> type='text/javascript'"></script>
    <script type="text/javascript">
        var PageIndex_For_ChartList = 0;
    </script>
    <script type="text/javascript">
        var jq = jQuery.noConflict(true);
        jq(document).ready(function () {
            fnDatePicker('#startDate', 1, false, "0", false, "0");
            fnDatePicker('#endDate', 1, false, "0", false, "0");

            GetMODIData();
            GetCPTData();
            GetICDData();

            OnlyDigit(jq('input.OnlyDigit'));


            GetReadyToBillData();

            jq("body").on('click', '.EdiTCls', function () {

                GetSuperBillRecordByUniqID(jq(this).attr('id'))

            });




            jq('#TxtAuthoNo').bind('keyup blur', function () {
                jq(this).val(jq(this).val().replace(/[^A-Za-z0-9]/g, ''))
            });

            /* Scroll event bind for Chart List */
            jq("#Ul_Chart_List").on("scroll", function (e) {
                if (jq("#Ul_Chart_List li").length != 0) {
                    var jqo = jq(e.currentTarget);
                    if (jqo[0].scrollHeight - jqo.scrollTop() <= jqo.outerHeight()) {
                        LoadChart_ByPatient(jq(".active-bill"));
                    }
                }
            });
            /* end Scroll event bind */
            if (jq("#hdnClientID_Session").val() == "13T") { // FOR 13T - PAT DOC SHOULD NOT VISIBLE
                jq("#li_tab_pat_doc").hide();
                jq("#li_tab_chart").css({ 'width': '100%' });
            }

        });
        jq(function () {
            jq("#tabs").tabs({ active: 2 });
        });
        jq(function () {
            jq("#accordion").accordion();
        });
        /* calculate left tab height */
        function leftTabheight() {
            try {
                var tabHeight = jq(".ui-tabs-nav").height();
                var tabcontentHeight = jq(".rdy-bill-status").height() - tabHeight - 4;
                jq(".tab-content").css("height", tabcontentHeight);
            } catch (err) {
                alert(err);
            }
        }

        function calSuperbillHeight() {

            var superBillHeight = jq(".superbill-container-content").innerHeight() - jq(".superbill-content-footer").innerHeight();
            jq(".superbill-content").css("height", +superBillHeight + "px");
        }
        jq(window).resize(function () {
            leftTabheight();
            calSuperbillHeight();
        });
        jq(window).load(function () {
            leftTabheight();
            calSuperbillHeight();
        });
        /* /calculate left tab height */

        jq("body").on("click", ".ready-to-bill ul li", function () {
            jq("#tab_chart").trigger("click");
            jq(".chart-doc").addClass("active-chart-doc");
            var selectBill = jq(".ready-to-bill ul li");
            jq(selectBill).removeClass("active-bill");
            jq(this).addClass("active-bill");
            var outerWidth = jq(".ready-bill-outer").width();
            jq(".ready-bill-outer").addClass("active-ready-bill-outer");
            jq(".ready-bill-outer").css("position", "absolute").animate({ left: "-" + outerWidth + "px" }, 100, function () { });
            jq(".rdy-bill-status").addClass("active-rdy-bill-status");
            leftTabheight();
            PageIndex_For_ChartList = 0;
            LoadChart_ByPatient(jq(this));

        });
        jq("body").on("click", ".left-toggle-icon", function () {
            jq(".chart-doc").removeClass("active-chart-doc");
            jq(".ready-bill-outer").css({ "position": "relative", "left": "0px" });
            jq(".ready-bill-outer").removeClass("active-ready-bill-outer");
            var selectBill = jq(".ready-to-bill ul li");
            //jq(selectBill).removeClass("active-bill");
            jq(".rdy-bill-status").removeClass("active-rdy-bill-status");
            jq('#ifrm_common').attr('src', '');
            jq("#Div_Chart_Or_Doc_Preview").hide();
            jq("#divImpCCD").hide();
            jq("#Ul_Chart_List li").removeClass("active-chart-print");
            jq('#Ul_Chart_List').scrollTop(0);
            jq("#Ul_Chart_List").empty();
            jq('#<%=HdnChartID.ClientID %>').val("");
            jq('#<%=HdnPatID.ClientID %>').val("");
            GetSuperBillRecord();
            superBillHide();
        });

        jq("body").on("click", "#spSave", function () {
            superBillHide();

        });
        jq("body").on("click", "#spCancel", function () {

            GetSuperBillRecord();
            ClearSB();
            superBillHide();

        });
        jq("body").on("click", "#addNewSuperbill", function () {
            if (jq('#<%=HdnChartID.ClientID %>').val() != "") {
                superBillShow();
                ClearSB();
                jq("#hfSBUID").val('')
            }
            else {
                alert("Please Select Chart");
                return false;
            }

        });
        /* edit super bill record */
        jq("body").on("click", ".edit-super", function () {
            superBillShow();
        });
        /* /edit super bill record */
        function superBillHide() {
            jq(".superbill-outer").hide();
            jq(".superbill-details").show();
            calSuperbillHeight();
        }
        function superBillShow() {
            jq(".superbill-outer").show();
            jq(".superbill-details").hide();
            calSuperbillHeight();
        }
        /* accordion */
        jq("body").on("click", ".accordion-header", function () {
            if (jq(this).parent().hasClass("active")) {
                jq(this).parent().removeClass("active");
                jq(this).parent().find(".accordion-content").slideToggle();
                jq(this).children(".chevron").removeClass("fa-chevron-up");
                jq(this).children(".chevron").addClass("fa-chevron-down");
            }
            else {
                jq(this).parent().addClass("active");
                jq(this).parent().find(".accordion-content").slideToggle();
                jq(this).children(".chevron").addClass("fa-chevron-up");
                jq(this).children(".chevron").removeClass("fa-chevron-down");
            }
        });

        /* /accordion */

        /* Single Chart click event  */
        jq("body").on("click", "#Ul_Chart_List li", function () {
            jq("#Ul_Chart_List li").removeClass("active-chart-print");
            jq(this).addClass("active-chart-print");
            LoadChartPrintData(jq(this));
            var selected_li = jq(".active-bill");
            var selected_pat = jq(selected_li).attr("data-value");
            if (typeof selected_pat === 'undefined') {
                alert('Please select record first !');
                return;
            }

            var cur_chart_id = jq(this).attr("data-value-chart-id");
            if (typeof cur_chart_id === 'undefined') {
                alert('Please select record first !');
                return;
            }

            jq('#<%=HdnChartID.ClientID %>').val(cur_chart_id);
            jq('#<%=HdnPatID.ClientID %>').val(selected_pat);
            GetSuperBillRecord(); // ########### fill superbill data for selected chart
            FillATTPrvPos();
            superBillHide();
        });

        /* Parent Folder click event   - Patient Doc Tab */
        jq("body").on("click", "#Ul_Pat_Doc .cls_Parent_li", function () {
            try {
                jq(this).find('.tree-submenu').slideToggle();
            } catch (err) {
                alert(err);
            }
        });

        /* Child File click event   - Patient Doc Tab */
        jq("body").on("click", "#Ul_Pat_Doc .cls_Child_li", function (evnt) {
            try {
                evnt.stopPropagation();
                ShowDocument(jq(this));
            } catch (err) {
                alert(err);
            }
        });

        /////////////////////////////////////////////////////DEVELOP BY JAYRAJ



        ///////////////////////////////////////////////////////// FILL CPT START

        function GetCPTData() {
            try {

                jq("#txtCPTList").autocomplete({
                    // jq("[id*=txtCPTList]").autocomplete({
                    select: function (event, ui) {
                        SelectedCPT('0', ui, 1, ' CPT', event);
                    },



                    source: function (request, response) {
                        jq.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            async: false,
                            url: "frmAdvanceSuperbill.aspx/GetSearchCPT",
                            data: "{'key':'" + document.getElementById('txtCPTList').value + "',type:'" + jq('input:radio[name=rdbtnCPT]:checked').val() + "'}",

                            dataType: "json",
                            success: function (data) {
                                //response(data.d);                               
                                response(JSON.parse(data.d));
                            }, // end of success
                            error: function (result) {
                                //alert("Error......");
                            },

                        }); // end of jq.ajax({
                    }
                }); // end of jq("#txtCPTList").autocomplete({
                jq("#txtCPTList").keypress(function (event) {
                    if (event.keyCode == 13) {
                        event.preventDefault();
                    }
                });

            } catch (e) {
                alert(e);
            }
        }
        //////////SELECT CPT
        function SelectedCPT(code, ui, Objcnt, CntName, evnt) {
            try {
                var Rec = 0;
                var VRec = 0;
                var Cpt = 0;

                jq(".accordion-item .accordion-header").each(function () {
                    if (jq(this).attr("id") == ui.item.value) {
                        Cpt++;
                    }
                });
                if (Cpt != 0) {
                    alert("Already Exist This" + CntName);
                }

                if (jq("#TblCPT tr").length != 0 && Cpt == 0) {

                    jq("#TblCPT tr").each(function () {
                        VRec++;
                        if (jq(this).closest('tr').attr('id') == ui.item.value) {
                            Rec++;
                        }
                    });
                    if (VRec < Objcnt) {
                        if (Rec == 0) {
                            jq("#TblCPT").append("<tr id=" + ui.item.value + "> <td style='width: 90%'>" + ui.item.label + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                        }
                        else {
                            alert("Already Exist This" + CntName);
                        }
                    }
                    else {
                        alert("Only Select " + Objcnt + CntName);
                    }
                }
                else {
                    if (Cpt == 0) {
                        jq("#TblCPT").append("<tr id=" + ui.item.value + "> <td style='width: 90%'>" + ui.item.label + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                    }

                }

                jq("#txtCPTList").val(""); // to cleare the ICD text box after selection
                evnt.preventDefault();
            }
            catch (err) {
                alert(err);
            }
        }

        ///////////////////////////////////////////////////////// FILL CPT END

        ///////////////////////////////////////////////////// FILL MODIFIER START    

        function GetMODIData() {
            try {
                //jq("[id*=txtModiList]").autocomplete({
                jq("#txtModiList").autocomplete({
                    select: function (event, ui) { SelectedModi('0', ui, 4, ' Modifier', event); },
                    source: function (request, response) {
                        jq.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "frmAdvanceSuperbill.aspx/GetModifier",
                            async: false,
                            data: "{'key':'" + document.getElementById('txtModiList').value + "'}",

                            dataType: "json",
                            success: function (data) {
                                //response(data.d);                               
                                response(JSON.parse(data.d));
                            }, // end of success
                            error: function (result) {
                                //alert("Error......");
                            },

                        }); // end of jq.ajax({
                    }
                }); // end of jq("#txtCPTList").autocomplete({
                jq("#txtModiList").keypress(function (event) {
                    if (event.keyCode == 13) {
                        event.preventDefault();
                    }
                });
            } catch (e) {
                alert(e);
            }
        }
        //////////SELECT MODIFIER
        function SelectedModi(code, ui, Objcnt, CntName, evnt_md) {
            try {
                var Rec = 0;
                var VRec = 0;
                if (jq("#TblModi tr").length != 0) {

                    jq("#TblModi tr").each(function () {

                        VRec++;
                        if (jq(this).closest('tr').attr('id') == ui.item.value) {
                            Rec++;
                        }
                    });
                    if (VRec < Objcnt) {
                        if (Rec == 0) {
                            jq("#TblModi").append("<tr id=" + ui.item.value + "> <td style='width: 90%'>" + ui.item.label + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                        }
                        else {
                            alert("Already Exist This" + CntName);
                        }
                    }
                    else {
                        alert("Only Select " + Objcnt + CntName);
                    }
                }
                else {
                    jq("#TblModi").append("<tr id=" + ui.item.value + "> <td style='width: 90%'>" + ui.item.label + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                }

            }
            catch (err) {
                alert(err);
            }
            jq("#txtModiList").val("");
            evnt_md.preventDefault();
        }

        //////////////////////////////////////////////////// FILL MODIFIER END



        ///////////////////////////////////////////////////////// FILL ICD START

        function GetICDData() {
            try {


                jq("#txtICDList").autocomplete({
                    // jq("[id*=txtCPTList]").autocomplete({
                    select: function (event, ui) { SelectedICD('0', ui, 8, ' ICD', event); },

                    source: function (request, response) {
                        jq.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            async: false,
                            url: "frmAdvanceSuperbill.aspx/GetSearchICD",
                            data: "{'key':'" + document.getElementById('txtICDList').value + "',type:'" + jq('input:radio[name=rdbtnICD]:checked').val() + "',PatID:'" + jq('#<%=HdnPatID.ClientID %>').val() + "'}",

                                dataType: "json",
                                success: function (data) {
                                    //response(data.d);                               
                                    response(JSON.parse(data.d));
                                }, // end of success
                                error: function (result) {
                                    //alert("Error......");
                                },

                            }); // end of jq.ajax({
                        }
                    }); // end of jq("#txtCPTList").autocomplete({
                    jq("#txtICDList").keypress(function (event) {
                        if (event.keyCode == 13) {
                            event.preventDefault();
                        }
                    });
                } catch (e) {
                    alert(e);
                }
            }
            //////////SELECT ICD
            function SelectedICD(code, ui, Objcnt, CntName, evnt_icd) {
                try {


                    var Rec = 0;
                    var VRec = 0;

                    if (jq("#TblICD tr").length != 0) {

                        jq("#TblICD tr").each(function () {

                            VRec++;
                            debugger;
                            var arr = ui.item.value.split('-');
                            var ans = jq(this).attr('id').split('-');
                            var te = jq.trim(ans[0]);
                            // alert(jq.trim(ans[0]) + "  ---  " + jq.trim(arr[0]));
                            if (jq.trim(ans[0]) == jq.trim(arr[0])) {
                                Rec++;
                            }
                        });
                        if (VRec < Objcnt) {
                            if (Rec == 0) {
                                jq("#TblICD").append("<tr id=" + ui.item.label + "> <td style='width: 90%'>" + ui.item.label + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ui.item.label + "'> </td></tr>");
                            }
                            else {
                                alert("Already Exist This" + CntName);
                            }
                        }
                        else {
                            alert("Only Select " + Objcnt + CntName);
                        }
                    }
                    else {
                        jq("#TblICD").append("<tr id=" + ui.item.label + "> <td style='width: 90%'>" + ui.item.label + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ui.item.label + "'>   </td></tr>");
                    }

                }
                catch (err) {
                    alert(err);
                }
                jq("#txtICDList").val("");
                evnt_icd.preventDefault();
            }

            ///////////////////////////////////////////////////////// FILL ICD END






            /////////////////COMMON VALIDATION  START  




            function validDate(Fdate, Tdate) {
                var txtFromdate = Fdate;
                var txtToDate = Tdate

                var dateformat = /^((0[13578]|1[02])[\/.](0[1-9]|[12][0-9]|3[01])[\/.](18|19|20)[0-9]{2})|((0[469]|11)[\/.](0[1-9]|[12][0-9]|30)[\/.](18|19|20)[0-9]{2})|((02)[\/.](0[1-9]|1[0-9]|2[0-8])[\/.](18|19|20)[0-9]{2})|((02)[\/.]29[\/.](((18|19|20)(04|08|[2468][048]|[13579][26]))|2000))$/g;
                // Match the date format through regular expression
                if (txtFromdate != "") {
                    if (txtFromdate.match(dateformat)) {
                        //Test which seperator is used '/' or '-'  

                        if (txtFromdate.indexOf('/') == -1 && txtFromdate.indexOf('-') == -1) {
                            alert('Invalid start date format!');
                            return false;
                        }

                        var opera1 = txtFromdate.split('/');
                        var opera2 = txtFromdate.split('-');
                        lopera1 = opera1.length;
                        lopera2 = opera2.length;
                        // Extract the string into month, date and year  
                        if (lopera1 > 1) {
                            var pdate = txtFromdate.split('/');
                        }
                        else if (lopera2 > 1) {
                            var pdate = txtFromdate.split('-');
                            var dd = parseInt(pdate[1]);
                            var mm = parseInt(pdate[0]);
                            var yy = parseInt(pdate[2]);
                            // Create list of days of a month [assume there is no leap year by default]  
                            var ListofDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                            if (mm == 1 || mm > 2) {
                                if (dd > ListofDays[mm - 1]) {
                                    alert('Invalid start date format!');
                                    return false;
                                }
                            }
                            if (mm == 2) {
                                var lyear = false;
                                if ((!(yy % 4) && yy % 100) || !(yy % 400)) {
                                    lyear = true;
                                }
                                if ((lyear == false) && (dd >= 29)) {
                                    alert('Invalid start date format!');
                                    return false;
                                }
                                if ((lyear == true) && (dd > 29)) {
                                    alert('Invalid start date format!');
                                    return false;
                                }
                            }
                        }
                        else {
                            alert("Invalid start date format!");
                            return false;
                        }
                    }
                    else {
                        alert("Invalid start date format!");
                        return false;
                    }
                }


                if (txtToDate != "") {
                    if (txtToDate.match(dateformat)) {
                        //Test which seperator is used '/' or '-'  
                        if (txtFromdate.indexOf('/') == -1 && txtFromdate.indexOf('-') == -1) {
                            alert('Invalid end date format!');
                            return false;
                        }
                        var opera1 = txtToDate.split('/');
                        var opera2 = txtToDate.split('-');
                        lopera1 = opera1.length;
                        lopera2 = opera2.length;
                        // Extract the string into month, date and year  
                        if (lopera1 > 1) {
                            var pdate = txtToDate.split('/');
                        }
                        else if (lopera2 > 1) {
                            var pdate = txtToDate.split('-');
                            var dd = parseInt(pdate[1]);
                            var mm = parseInt(pdate[0]);
                            var yy = parseInt(pdate[2]);
                            // Create list of days of a month [assume there is no leap year by default]  
                            var ListofDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                            if (mm == 1 || mm > 2) {
                                if (dd > ListofDays[mm - 1]) {
                                    alert('Invalid end date format!');
                                    return false;
                                }
                            }
                            if (mm == 2) {
                                var lyear = false;
                                if ((!(yy % 4) && yy % 100) || !(yy % 400)) {
                                    lyear = true;
                                }
                                if ((lyear == false) && (dd >= 29)) {
                                    alert('Invalid end date format!');
                                    return false;
                                }
                                if ((lyear == true) && (dd > 29)) {
                                    alert('Invalid end date format!');
                                    return false;
                                }
                            }
                        }
                        else {
                            alert("Invalid end date format!");
                            return false;
                        }
                    }
                    else {
                        alert("Invalid end date format!");
                        return false;
                    }
                }

                var Fromdate = Date.parse(txtFromdate);
                var ToDate = Date.parse(txtToDate);

                if (Fromdate > ToDate) {
                    alert("End Date should be greater than or equal to the Start Date.");
                    return false;
                }

                return true;

            }


            function OnlyDigit(obj) {
                jq(obj).keydown(function (e) {
                    // Allow: backspace, delete, tab, escape, enter and .
                    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                        // Allow: Ctrl+A, Command+A
                (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                        // Allow: home, end, left, right, down, up
                (e.keyCode >= 35 && e.keyCode <= 40)) {
                        // let it happen, don't do anything
                        if (e.keyCode == 46 || e.keyCode == 8) {
                            calculate();
                        }
                        return;
                    }
                    // Ensure that it is a number and stop the keypress
                    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                        e.preventDefault();
                    }
                });
            }


            ////////////////////////////////////END


            function SelectGet(e) {
                jq("#TblPro").css("display", "");

                jq('#TxtFname').val('');
                jq('#TxtLname').val('');
                jq('#TxtNPI').val('');


                var ddlval = jq("#ddlPro").val();


                if (ddlval == 'DK') {
                    jq('#SpanFname').text("Ordering First Name");
                    jq('#SpanLname').text("Ordering Last Name");
                    jq('#SpanNPI').text("Ordering NPI");
                }
                else if (ddlval == 'DN') {
                    jq('#SpanFname').text("Refering First Name");
                    jq('#SpanLname').text("Refering Last Name");
                    jq('#SpanNPI').text("Refering NPI");
                }
                else if (ddlval == 'DQ') {
                    jq('#SpanFname').text("Supervising First Name");
                    jq('#SpanLname').text("Supervising Last Name");
                    jq('#SpanNPI').text("Supervising NPI");
                }
                else {
                    jq("#TblPro").css("display", "none");
                }
            }

            ////////////////////////////////////SAVE SUPER BILL

            function Validation() {
                debugger;
                var PON = jq("#TxtAuthoNo").val();
                var NPI = jq("#TxtNPI").val();
                var ddlval = jq("#ddlPro").val();
                var rate = jq("").val();
                var Qlt = jq("").val();

                var SDTCol = jq('.ClsSDt');
                var EDTCol = jq('.ClsEDt');


                if (jq("#TblCPT tr").length == 0) {
                    alert("Please Select CPT");
                    return false;
                }
                if (jq('#<%=HdnCPID.ClientID %>').val() == "") {
                alert("Please Re-Select Patient");
                return false;
            }

            if (!(validDate(SDTCol.val(), EDTCol.val()))) {
                return false;
            }
            if (jq("#TxtQty").val() != "") {
                if (jq("#TxtRate").val() == "") {
                    alert("Please Enter Rate");
                    return false;
                }

            }
            if (jq("#TxtRate").val() != "") {
                if (jq("#TxtQty").val() == "") {
                    alert("Please Enter Qty");
                    return false;
                }

            }




            return true;

        }



        function SaveSBill(obj) {
            try {

                debugger;
                var retvalue = 0;
                var HdbSBUNQ;

                if (!Validation()) {
                    return;
                }

                var SBillData = {};
                HdbSBUNQ = jq("#hfSBUID");
                SBillData.UniqID = jq("#hfSBUID").val();
                SBillData.ChartID = jq("#<%= HdnChartID.ClientID%>").val();
                SBillData.Bill_POS = jq('#<%=HdnPOS.ClientID %>').val();
                SBillData.BillPro = jq('#<%=HdnAttPrvId.ClientID %>').val();

                //CPT
                SBillData.CPTCode = jq("#TblCPT tr").attr('id');

                //MODIFIER
                if (jq("#TblModi tr").length != 0) {
                    var ModiArray = [];
                    jq("#TblModi tr").each(function () {
                        ModiArray.push(jq(this).closest('tr').attr('id'));
                    });
                    SBillData.Bill_Modifier = ModiArray[0];
                    SBillData.Bill_Modifier2 = ModiArray[1];
                    SBillData.Bill_Modifier3 = ModiArray[2];
                    SBillData.Bill_Modifier4 = ModiArray[3];
                }
                //ICD
                if (jq("#TblICD tr").length != 0) {
                    var ICDArray = [];
                    jq("#TblICD tr").each(function () {

                        var ICDID = $(this).find('.ICDVal').val();
                        ICDArray.push(ICDID);
                    });
                    SBillData.ICdCode1 = ICDArray[0];
                    SBillData.ICdCode2 = ICDArray[1];
                    SBillData.ICdCode3 = ICDArray[2];
                    SBillData.ICdCode4 = ICDArray[3];
                    SBillData.ICdCode5 = ICDArray[4];
                    SBillData.ICdCode6 = ICDArray[5];
                    SBillData.ICdCode7 = ICDArray[6];
                    SBillData.ICdCode8 = ICDArray[7];

                }


                SBillData.StartDate = jq("#startDate").val();
                SBillData.EndDate = jq("#endDate").val();
                SBillData.Qty = jq("#TxtQty").val();
                SBillData.Rate = jq("#TxtRate").val();

                SBillData.Units = jq("#ddlUnits option:selected").val();
                SBillData.OtherProType = jq("#ddlPro option:selected").val();
                SBillData.Status = jq("#ddlStatus option:selected").val();
                //  SBillData.TotalPrice = jq('#SpnTotal').text();
                SBillData.PON = jq("#TxtAuthoNo").val();
                SBillData.Notes = jq("#TxtNote").val();
                SBillData.Fname = jq("#TxtFname").val();
                SBillData.Lname = jq("#TxtLname").val();
                SBillData.NPI = jq("#TxtNPI").val();

                var SBObj = SBillData;


                if (SBObj != null) {
                    $.ajax({
                        type: 'POST',
                        url: 'frmAdvanceSuperbill.aspx/SaveSuperBill',
                        data: "{SBObj:" + JSON.stringify(SBObj) + "}",
                        async: false,
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        async: false,
                        success: function (data) {
                            if (data.d != null) {
                                var SBUNiqID = data.d;
                                HdbSBUNQ.val(SBUNiqID);
                                if (retvalue == 0) {
                                    alert("Save Successfully");
                                    PageMethods.AuditLogDirectData("Chart", "Chart Super Bill Saved SuccessFul", "S");
                                    //BlockProcess();
                                    //refreshTabPage();
                                }
                                retvalue = 1;
                                jq(".active-chart-print").trigger("click"); // code for reload selected chart with latest print details
                            }
                            <%-- if (jq('#<%=HdnFromMenu.ClientID %>').val() != "true") {
                                    CloseWin();
                                }--%>
                            //alert(data.d);
                        } //end of success
                    });  // end ajax
                }
                else {
                    alert('Invalid Data !');
                }

            }
            catch (err) {
                alert(err);
            }
        }

        //////////////////Clear
        function ClearSB() {
            jq("#TxtAuthoNo").val('');
            jq("#TxtNote").val('');
            jq('#ddlUnits').prop('selectedIndex', 0);
            jq('#ddlPro').prop('selectedIndex', 0);
            jq('#ddlStatus').prop('selectedIndex', 2);
            jq('#TxtFname').val('');
            jq('#TxtLname').val('');
            jq('#TxtNPI').val('');
            jq("#TblICD").empty();
            jq("#TblModi").empty();
            jq("#TblCPT").empty();
            jq("#txtCPTList").val('');
            jq("#txtModiList").val('');
            jq("#txtICDList").val('');
            jq("#TxtQty").val('');
            jq("#TxtRate").val('');
            jq("#hfSBUID").val('');

        }


        /////////////////Fill Super Bill Data

        function GetSuperBillRecord() {
            try {

                var HdnCharId = jq('#<%=HdnChartID.ClientID %>').val();
                var HdnPatID = jq('#<%=HdnPatID.ClientID %>').val();


                jq("#DivSuperDis").empty();

                if (HdnPatID != "") {
                    // jq('#parentdiv').removeClass("DisableDiv");
                    jq.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "frmAdvanceSuperbill.aspx/GetSuperBillDetails",
                        data: "{ChartId:'" + HdnCharId + "',SbUniqID:''}",
                        async: false,
                        dataType: "json",
                        success: function (data) {
                            var data1 = JSON.parse(data.d)
                            var strTbl = '';
                            if (data1.length > 0) {
                                jq(data1).each(function () {
                                    // $('#<%=HdnSBUniqID.ClientID %>').val(jq(this)[0].Bill_UniqID);

                                    if (this.CPTCodeNAME != null) {



                                        strTbl += "<div class='accordion-item'><div id=" + this.CPTCodeNAME + " class='accordion-header'>" + this.CPTCodeNAME + "<i class='fa fa-edit EdiTCls' id='" + this.Bill_UniqID + "'></i><i class='fa fa-chevron-down chevron'></i></div><div class='accordion-content' style='display: none;'>";
                                        strTbl += "<table>";
                                        if (this.Modifier != '' && this.Modifier != null) {
                                            strTbl += "<tr><td><b>Modifier :-<b><td></tr>";
                                            strTbl += "<tr><td>" + this.Modifier + "<td></tr>";
                                        }
                                        if (this.Modifier2 != '' && this.Modifier2 != null) {
                                            strTbl += "<tr><td>" + this.Modifier2 + "<td></tr>";
                                        }
                                        if (this.Modifier3 != '' && this.Modifier3 != null) {
                                            strTbl += "<tr><td>" + this.Modifier3 + "<td></tr>";
                                        }
                                        if (this.Modifier4 != '' && this.Modifier4 != null) {
                                            strTbl += "<tr><td>" + this.Modifier4 + "<td></tr>";
                                        }
                                        if (this.ICDNAME1 != '' && this.ICDNAME1 != null) {
                                            strTbl += "<tr><td><b>ICD :-</b><td></tr>";
                                            strTbl += "<tr><td>" + this.ICDNAME1 + "<td></tr>";
                                        }
                                        if (this.ICDNAME2 != '' && this.ICDNAME2 != null) {
                                            strTbl += "<tr><td>" + this.ICDNAME2 + "<td></tr>";
                                        }
                                        if (this.ICDNAME3 != '' && this.ICDNAME3 != null) {
                                            strTbl += "<tr><td>" + this.ICDNAME3 + "<td></tr>";
                                        }
                                        if (this.ICDNAME4 != '' && this.ICDNAME4 != null) {
                                            strTbl += "<tr><td>" + this.ICDNAME4 + "<td></tr>";
                                        }
                                        if (this.ICDNAME5 != '' && this.ICDNAME5 != null) {
                                            strTbl += "<tr><td>" + this.ICDNAME5 + "<td></tr>";
                                        }
                                        if (this.ICDNAME6 != '' && this.ICDNAME6 != null) {
                                            strTbl += "<tr><td>" + this.ICDNAME6 + "<td></tr>";
                                        }
                                        if (this.ICDNAME7 != '' && this.ICDNAME7 != null) {
                                            strTbl += "<tr><td>" + this.ICDNAME7 + "<td></tr>";
                                        }
                                        if (this.ICDNAME8 != '' && this.ICDNAME8 != null) {
                                            strTbl += "<tr><td>" + this.ICDNAME8 + "<td></tr>";
                                        }
                                        if (this.StartDate != null) {
                                            strTbl += "<tr><td> <b>Start Date :-</b> " + this.StartDate + "<td></tr>";
                                            strTbl += "<tr><td><b> End Date :- </b>" + this.EndDate + "<td></tr>";
                                        }
                                        if (this.Qty != null) {
                                            strTbl += "<tr><td> <b>Qty :</b>   " + this.Qty + " <b>Rate :</b>  " + this.Rate + "<td></tr>";

                                        }

                                        if (this.Notes != null) {
                                            strTbl += "<tr><td> <b>Notes :</b>   " + this.Notes + "<td></tr>";
                                        }
                                        strTbl += "</table>";
                                        strTbl += "</div></div>";
                                    }

                                });
                                jq("#DivSuperDis").html(strTbl);
                            }
                        }
                    });

                }
            } catch (e) {
                alert(e)
            }

        }





        //////////////////////////////////////////Get Super Bill Data By Superbill Uniq ID Edit Mode     


        function GetSuperBillRecordByUniqID(SuperBillUniqID) {
            try {


                ClearSB();
                var SuperBillID = SuperBillUniqID;
                var HdnCharId = jq('#<%=HdnChartID.ClientID %>').val();
                var HdnPatID = jq('#<%=HdnPatID.ClientID %>').val();
                jq("#hfSBUID").val(SuperBillID);
                //while press cntlr+F5
                if (HdnPatID != "") {
                    // jq('#parentdiv').removeClass("DisableDiv");
                    jq.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "frmAdvanceSuperbill.aspx/GetSuperBillDetails",
                        data: "{ChartId:'" + HdnCharId + "',SbUniqID:'" + SuperBillID + "'}",
                        dataType: "json",
                        success: function (data) {
                            var data1 = JSON.parse(data.d)

                            if (data1.length > 0) {

                                var ans = data1[0];
                                if (ans.CPTCode != null) {
                                    jq("#TblCPT").append("<tr id=" + ans.CPTCode + "> <td style='width: 90%'>" + ans.CPTCodeNAME + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                                }
                                if (ans.Bill_Modifier != '' && ans.Bill_Modifier != null) {
                                    jq("#TblModi").append("<tr id=" + ans.Bill_Modifier + "> <td style='width: 90%'>" + ans.Modifier + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                                }
                                if (ans.Bill_Modifier2 != '' && ans.Bill_Modifier2 != null) {
                                    jq("#TblModi").append("<tr id=" + ans.Bill_Modifier2 + "> <td style='width: 90%'>" + ans.Modifier2 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                                }
                                if (ans.Bill_Modifier3 != '' && ans.Bill_Modifier3 != null) {
                                    jq("#TblModi").append("<tr id=" + ans.Bill_Modifier3 + "> <td style='width: 90%'>" + ans.Modifier3 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                                }
                                if (ans.Bill_Modifier4 != '' && ans.Bill_Modifier4 != null) {
                                    jq("#TblModi").append("<tr id=" + ans.Bill_Modifier4 + "> <td style='width: 90%'>" + ans.Modifier4 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i></td></tr>");
                                }

                                if (ans.ICDNAME1 != null) {
                                    jq("#TblICD").append("<tr id=" + ans.ICdCode1 + "> <td style='width: 90%'>" + ans.ICDNAME1 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ans.ICDNAME1 + "'>   </td></tr>");

                                }
                                if (ans.ICDNAME2 != null) {
                                    jq("#TblICD").append("<tr id=" + ans.ICdCode2 + "> <td style='width: 90%'>" + ans.ICDNAME2 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ans.ICDNAME2 + "'>   </td></tr>");

                                }
                                if (ans.ICDNAME3 != null) {
                                    jq("#TblICD").append("<tr id=" + ans.ICdCode3 + "> <td style='width: 90%'>" + ans.ICDNAME3 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ans.ICDNAME3 + "'>   </td></tr>");

                                }
                                if (ans.ICDNAME4 != null) {
                                    jq("#TblICD").append("<tr id=" + ans.ICdCode4 + "> <td style='width: 90%'>" + ans.ICDNAME4 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ans.ICDNAME4 + "'>   </td></tr>");

                                }
                                if (ans.ICDNAME5 != null) {
                                    jq("#TblICD").append("<tr id=" + ans.ICdCode5 + "> <td style='width: 90%'>" + ans.ICDNAME5 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ans.ICDNAME5 + "'>   </td></tr>");

                                }
                                if (ans.ICDNAME6 != null) {
                                    jq("#TblICD").append("<tr id=" + ans.ICdCode6 + "> <td style='width: 90%'>" + ans.ICDNAME6 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ans.ICDNAME6 + "'>   </td></tr>");

                                }
                                if (ans.ICDNAME7 != null) {
                                    jq("#TblICD").append("<tr id=" + ans.ICdCode7 + "> <td style='width: 90%'>" + ans.ICDNAME7 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ans.ICDNAME7 + "'>   </td></tr>");

                                }
                                if (ans.ICDNAME8 != null) {
                                    jq("#TblICD").append("<tr id=" + ans.ICdCode8 + "> <td style='width: 90%'>" + ans.ICDNAME8 + "</td><td style='width: 10%; text-align: center'><i onclick=jq(this).closest('tr').remove(); class='fa fa-times'></i> <input type=hidden class='ICDVal' value='" + ans.ICDNAME8 + "'>   </td></tr>");
                                }
                                if (ans.Notes != null) {
                                    jq("#TxtNote").val(ans.Notes);
                                }
                                if (ans.Qty != null) {
                                    jq("#TxtQty").val(ans.Qty);
                                }
                                if (ans.Rate != null) {
                                    jq("#TxtRate").val(ans.Rate);
                                }
                                jq(this).find('.ClsUNT').val(ans.Units);
                                if (ans.StartDate != null) {
                                    jq("#startDate").val(ans.StartDate);
                                }
                                if (ans.EndDate != null) {
                                    jq("#endDate").val(ans.EndDate);
                                }
                                if (ans.PON != null) {
                                    jq("#TxtAuthoNo").val(ans.PON);
                                }
                                jq("#ddlStatus option:contains(" + ans.Bill_Status + ")").prop('selected', 'selected');

                                if (ans.OtherType != null) {
                                    jq("#ddlPro option:contains(" + ans.OtherType + ")").prop('selected', 'selected');
                                    SelectGet(jq("#ddlPro"));
                                    jq('#TxtFname').val(ans.Fname);
                                    jq('#TxtLname').val(ans.Lname);
                                    jq('#TxtNPI').val(ans.NPI);
                                } else {
                                    jq("#ddlPro option:contains(0)").prop('selected', 'selected');
                                }


                            }
                        }
                    });
                    superBillShow();
                }
            } catch (e) {
                alert(e)
            }

        }


        /////////////////////FIll Provider

        function FillATTPrvPos() {
            var HdnCharId = $('#<%=HdnChartID.ClientID %>').val();
            jq.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "frmAdvanceSuperbill.aspx/GetPrvPos",
                data: "{ChartId:'" + HdnCharId + "'}",
                dataType: "json",
                success: function (data) {
                    var data1 = JSON.parse(data.d)
                    if (data1.length > 0) {
                        $('#<%=HdnPOS.ClientID %>').val(data1[0].mpos_code);
                        $('#<%=HdnPOSName.ClientID %>').val(data1[0].mpos_description);
                        $('#<%=HdnAttPrvId.ClientID %>').val(data1[0].mp_uniq_id);
                        $('#<%=txtattprv.ClientID %>').val(data1[0].Prov_name);
                        $('#<%=txtPOS.ClientID %>').val(data1[0].mpos_description);
                        jq("#startDate").val(data1[0].ChartDate);
                        jq("#endDate").val(data1[0].ChartDate);




                    } else {
                        $('#<%=HdnPOS.ClientID %>').val("");
                        $('#<%=HdnPOSName.ClientID %>').val("");
                        $('#<%=HdnAttPrvId.ClientID %>').val("");
                        $('#<%=txtattprv.ClientID %>').val("");
                        $('#<%=txtPOS.ClientID %>').val("");
                    }
                },
                error: function (result) {
                    //alert("Error");
                }
            });
        }







        ///////////////////////////////////////////////////DEVELOP BY CHINTS

        /* Ready to Bill */
        function GetReadyToBillData() {
            try {
                jq("#Ul_Ready_To_Bill").empty();
                jq.ajax({
                    type: "POST",
                    url: "frmAdvanceSuperbill.aspx/GetReadyToBill_Data",
                    contentType: "application/json;charset=utf-8",
                    data: "{}",
                    dataType: "json",
                    success: function (data, response) {
                        try {
                            var All_Data = JSON.parse(data.d);
                            //alert(All_Data.length);
                            jq.each(All_Data, function () {
                                var cur_recrd = jq(this)[0];
                                var ul_li = "<li data-value='" + cur_recrd.PatID + "'>" +
                                    "<span class='bill-date'><b>" + cur_recrd.ChartDate + "</b></span>" +
                                    "<span>" + cur_recrd.CTM_TemplateName + "</span>" +
                                    "<span>" + cur_recrd.PatientName + "</span>" +
                                    "<input type='hidden' class='hdn_Chart_ID_Bill' value='" + cur_recrd.ChartID + "' />" +
                                    "</li>";

                                jq("#Ul_Ready_To_Bill").append(ul_li);
                            });
                        } // end of try
                        catch (err) {
                            alert(err);
                        } // end of catch
                    } // end of success
                });       // end of jq.ajax
            } catch (err) {
                alert(err);
            }
        }

        /* LoadChart_By Patient */
        function LoadChart_ByPatient(selected_li) {
            try {
                var selected_pat = jq(selected_li).attr("data-value");
                var IsFirst = false;
                if (typeof selected_pat === 'undefined') {
                    alert('Please select record first !');
                    return;
                }
                var selected_bill_Chart = jq(selected_li).find(".hdn_Chart_ID_Bill");
                if (typeof selected_bill_Chart === 'undefined') {
                    alert('Please select record first !');
                    return;
                }
                if (PageIndex_For_ChartList == 0) {
                    IsFirst = true;
                    jq("#Ul_Chart_List").empty();
                }
                PageIndex_For_ChartList++;
                var Bill_Obj = {};
                Bill_Obj.Pat_ID = selected_pat;
                Bill_Obj.PageIndex = PageIndex_For_ChartList;
                Bill_Obj.hdn_Chart_ID_Bill = jq(selected_li).find(".hdn_Chart_ID_Bill").val();
                jq.ajax({
                    type: "POST",
                    url: "frmAdvanceSuperbill.aspx/Get_ChartList_ByPatient",
                    contentType: "application/json;charset=utf-8",
                    data: "{Bill_Obj:" + JSON.stringify(Bill_Obj) + "}",
                    dataType: "json",
                    success: function (data, response) {
                        try {
                            var All_Data = JSON.parse(data.d);
                            jq.each(All_Data, function () {
                                var cur_recrd_chart = jq(this)[0];
                                var ul_li = "<li data-value-chart-id='" + cur_recrd_chart.ChartID + "'>" +
                                        "<p title='Refill Request Date' class='tab-content-title'>" + cur_recrd_chart.ChartDateTime + "</p>" +
                                        "<p><span>" + cur_recrd_chart.CTM_TemplateName + "</span></p>" +
                                        "<p><span>" + cur_recrd_chart.HospitalName + "</span></p>" +
                                        "<p><span>" + cur_recrd_chart.AttProviderName + "</span></p>" +
                                    "</li>";

                                jq("#Ul_Chart_List").append(ul_li);
                            });
                            if (IsFirst) {
                                Load_PatDoc_List(selected_li);
                            }

                        } // end of try
                        catch (err) {
                            alert(err);
                        } // end of catch
                    } // end of success
                });       // end of jq.ajax
            } catch (err) {
                alert(err);
            }
        }

        /* Load Chart Print Data - on click on Chart  */
        function LoadChartPrintData(cur_chart_li) {
            try {
                var cur_chart_id = jq(cur_chart_li).attr("data-value-chart-id");
                if (typeof cur_chart_id === 'undefined') {
                    alert('Please select record first !');
                    return;
                }
                jq("#div_print_loader").show();
                jq("#Div_Chart_Or_Doc_Preview").show();
                jq('#ifrm_common').attr('src', "../Reports/frmPrintAllNew.aspx?ChartID=" + cur_chart_id + "&PrintInfo=&ChartMgt=1").load(function () {
                    jq(this).fadeIn(300);
                    jq("#div_print_loader").hide();
                });

            } catch (err) {
                alert(err);
            }
        }

        /* Load_PatDoc_List - after chart load is complete */
        function Load_PatDoc_List(selected_li) {
            try {
                jq("#Ul_Pat_Doc").empty();
                var selected_pat = jq(selected_li).attr("data-value");
                if (typeof selected_pat === 'undefined') {
                    alert('Please select record first !');
                    return;
                }
                var Doc_Load_Obj = {};
                Doc_Load_Obj.Pat_ID = selected_pat;
                jq.ajax({
                    type: "POST",
                    url: "frmAdvanceSuperbill.aspx/Get_PatDoc_List_ByPatient",
                    contentType: "application/json;charset=utf-8",
                    data: "{Doc_Load_Obj:" + JSON.stringify(Doc_Load_Obj) + "}",
                    dataType: "json",
                    success: function (data, response) {
                        try {
                            if (jq("#hdnClientID_Session").val() != "13T") { // FOR 13T - PAT DOC SHOULD NOT VISIBLE
                                var All_Data = JSON.parse(data.d);
                                var dtcnt = Object.keys(All_Data);
                                //alert(dtcnt.length);
                                for (var i = 0; i < dtcnt.length; i++) {
                                    var doc_Type = dtcnt[i];
                                    //alert(doc_Type);
                                    //alert("doc_Type: " + doc_Type + " - Count: " + All_Data[doc_Type].length);
                                    var single_dt = All_Data[doc_Type];
                                    if (single_dt.length > 0) {
                                        var final_li = "<li class='cls_Parent_li'>" +
                                                            "<span>" +
                                                                "<img src='../App_Themes/NewTheme/images/folder-new.png' alt='' style='border-width:0;' />" +
                                                                "<span style='padding-left: 5px;'>" + doc_Type + "</span>" +
                                                                "<input type='hidden' class='hdn_Doc_Type' value='" + doc_Type + "' />" +
                                                            "</span>" +
                                                            "<ul class='tree-submenu' >";
                                        jq.each(single_dt, function () {
                                            var cur_recrd_doc = jq(this)[0];
                                            var ul_li = "<li class='cls_Child_li'>" +
                                                           "<img src='../App_Themes/NewTheme/images/text-doc-icon.png' alt='' style='border-width:0;' />" +
                                                           "<span>" + cur_recrd_doc.Doc_Desc + "</span>" +
                                                           "<input type='hidden' class='hdn_FileName' value='" + cur_recrd_doc.Doc_Filename + "' />" +
                                                           "<input type='hidden' class='hdn_CpID' value='" + cur_recrd_doc.cp_id + "' />" +
                                                        "</li>";
                                            final_li += ul_li;
                                        });
                                        final_li += "</ul> </li>";
                                        jq("#Ul_Pat_Doc").append(final_li);
                                    }
                                }
                                jq('.tree-submenu').slideUp();
                            }
                            setTimeout(function () {
                                jq("#Ul_Chart_List li:eq(0)").trigger("click");
                            }, 800); // for make selected first chart - apply setTimeout to let finish animation first
                        } // end of try
                        catch (err) {
                            alert(err);
                        } // end of catch

                    } // end of success
                });       // end of jq.ajax
            } catch (err) {
                alert(err);
            }
        }


        /* ShowDocument - click event when user click on child document */
        function ShowDocument(slected_file) {
            try {

                var selected_li = jq(".active-bill");
                var selected_pat = jq(selected_li).attr("data-value");
                if (typeof selected_pat === 'undefined') {
                    alert('Please select record first !');
                    return;
                }
                var fileName_Ctrl = jq(slected_file).find('.hdn_FileName');
                if (typeof fileName_Ctrl === 'undefined') {
                    alert('Please select document.');
                    return;
                }
                //jq('#ifrm_common').attr('src', '');
                jq('#ifrm_common').hide();
                jq('#divImpCCD').hide();
                jq('#Div_Chart_Or_Doc_Preview').show();
                jq("#div_print_loader").show();
                var CPID = jq(slected_file).find('.hdn_CpID').val();
                var Parent_Text = jq(slected_file).closest('.cls_Parent_li').find('.hdn_Doc_Type').val();
                var Show_Doc_Obj = {};
                Show_Doc_Obj.fileName = jq(fileName_Ctrl).val();
                Show_Doc_Obj.selected_pat = selected_pat;
                Show_Doc_Obj.CPID = CPID;
                Show_Doc_Obj.Parent_Text = Parent_Text;
                jq.ajax({
                    type: "POST",
                    url: "frmAdvanceSuperbill.aspx/ShowPat_Doc",
                    contentType: "application/json;charset=utf-8",
                    data: "{Show_Doc_Obj:" + JSON.stringify(Show_Doc_Obj) + "}",
                    dataType: "json",
                    success: function (data, response) {
                        try {

                            var All_Data = JSON.parse(data.d);
                            if (All_Data[0].ISFileNotFound == "true") {
                                alert("File not found.");
                                jq("#div_print_loader").hide();
                            }
                            else if (All_Data[0].IsDiv == "true") {
                                jq('#ifrm_common').hide();
                                jq('#divImpCCD').show();
                                jq('#divImpCCD').html(All_Data[0].DataCol);
                                jq("#div_print_loader").hide();
                            }
                            else if (All_Data[0].IsDiv == "false") {
                                jq('#divImpCCD').hide();
                                jq('#ifrm_common').show();
                                //jq('#ifrm_common').attr('src', All_Data[0].DataCol);
                                jq('#ifrm_common').attr('src', All_Data[0].DataCol).load(function () {
                                    jq(this).fadeIn(300);
                                    jq("#div_print_loader").hide();
                                });
                            }
                            //alert(dtcnt.length);

                        } // end of try
                        catch (err) {
                            alert(err);
                        } // end of catch
                    } // end of success
                });       // end of jq.ajax

            } catch (err) {
                alert(err);
            }
        }

    </script>
</body>
</html>
