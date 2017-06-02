<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="autocmplt.aspx.cs" Inherits="DeveloperHelper2013.SamplePages.autocmplt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="custom-select search-new">
                <input type="text" title="Patient" class="select-input" id="txtPatientNameSys" data-livalue=""
                    placeholder="Select Patient" autocomplete="off" />
                <ul class="select-drop" style="display: none; overflow: auto; max-height: 200px;" id="ulPatient"></ul>
            </div>

            <script>


                function closeSelectdrop(selectDrop) {
                    selectDrop.hide();
                }
                jq("body").click(function () {
                    var selectDrop = jq(".select-drop");
                    closeSelectdrop(selectDrop);
                });

                jq(".custom-select").on("click", ".select-drop li", function (e) {

                    var ulId = jq(this).parent().attr("id");
                    var selectId = jq(this).attr("id");
                    var selectDropval = jq(this).html();
                    jq(this).parent().parent().find("input").val(selectDropval);
                    jq(this).parent().parent().find("input").attr("data-livalue", selectId);

                });

                jq(".custom-select").on("click", ".select-input", function (e) {
                    e.stopPropagation();
                    var selectDrop = jq(".select-drop");
                    closeSelectdrop(selectDrop);
                    var selectUl = jq(this).parent().find(".select-drop");
                });
                jq(".select-input").keyup(function (e) {
                    var ulId = jq(this).parent().find(".select-drop").attr("id");
                    var selectUl = jq(this).parent().find(".select-drop");
                    var inputVal = jq(this).val();
                    if (e.keyCode != 38 && e.keyCode != 40 && e.keyCode != 13) {
                        selectUl.show();
                        jq(selectUl).scrollTop(0);
                        debugger;
                        if (inputVal == '') {
                            jq(this).parent().parent().find("input").attr("data-livalue", '');
                        }
                        else {
                            GetAutocompetePatient('txtPatientNameSys');
                        }


                    }
                });
                jq(".select-input").keydown(function (e) {
                    var ulId = jq(this).parent().find(".select-drop").attr("id");
                    var getUl = jq(this).parent().find(".select-drop");
                    var offset = getUl.offset();
                    var getOffset = offset.top;
                    getulHeight = jq(getUl).height() - 20;
                    setScrollTop = getOffset + getulHeight;
                    var widget = jq(this);
                    var list = widget.parent().children('.select-drop');
                    var scroll = function (event) {
                        list.scrollTo('.selecteddropli');
                    };
                    jq.fn.scrollTo = function (target, options, callback) {
                        if (typeof options === 'function' && arguments.length === 2) {
                            callback = options;
                            options = target;
                        }
                        var settings = jq.extend({
                            scrollTarget: target,
                            offsetTop: setScrollTop,
                            duration: 0,
                            easing: 'linear'
                        }, options);
                        return this.each(function (i) {
                            var scrollPane = jq(this);
                            var scrollTarget = (typeof settings.scrollTarget === 'number') ? settings.scrollTarget : jq(settings.scrollTarget);
                            var scrollY = (typeof scrollTarget === 'number') ? scrollTarget : scrollTarget.offset().top + scrollPane.scrollTop() - parseInt(settings.offsetTop, 10);
                            scrollPane.animate({ scrollTop: scrollY }, parseInt(settings.duration, 10), settings.easing, function () {
                                if (typeof callback === 'function') {
                                    callback.call(this);
                                }
                            });
                        });
                    };
                    if (e.keyCode == 13) { // enter                      
                        if (jq(".select-drop").is(":visible")) {
                            var selectedLi = jq(this);
                            var disableLi = jq(selectedLi).parent().find(".select-drop li.selecteddropli").attr("class");
                            if (disableLi == 'disable-li selecteddropli' || disableLi == 'selecteddropli disable-li') {
                                e.preventDefault();
                            }
                            else {
                                var selectElement = jq(selectedLi).parent().find(".select-drop li.selecteddropli").attr("id");
                                var ulId = jq(this).attr("id");

                                jq(this).parent().parent().find("input").attr("data-livalue", selectElement);

                                selectOption(selectedLi);
                                closeDropdownlist();
                                e.preventDefault();
                            }
                        }
                    }
                    if (e.keyCode == 38) { // up                
                        var selected = jq(".selecteddropli");
                        jq(".select-drop li").removeClass("selecteddropli");
                        if (selected.prev().length == 0) {
                            selected.siblings().last().addClass("selecteddropli");
                        } else {
                            selected.prev().addClass("selecteddropli");
                        }
                        scroll();
                    }
                    if (e.keyCode == 40) { // down  
                        var selected = jq(".selecteddropli");
                        jq(".select-drop li").removeClass("selecteddropli");
                        if (selected.next().length == 0) {
                            selected.siblings().first().addClass("selecteddropli");
                        } else {
                            selected.next().addClass("selecteddropli");
                        }
                        scroll();
                    }
                    if (e.keyCode == 9) { // tab      
                        var selectedLi = jq(this);
                        var selectValue = jq(this).parent().parent().find("input").attr("data-livalue");
                        if (selectValue == '') {
                            jq(selectedLi).parent().find(".select-drop").text('');
                            jq(selectedLi).val('');
                            closeDropdownlist();
                        }
                    }

                });
                function selectOption(selectElem) {
                    if (jq(selectElem).parent().find(".select-drop li.selecteddropli").html() != null) {
                        jq(selectElem).val(jq(selectElem).parent().find(".select-drop li.selecteddropli").text());
                    }
                }
                function closeDropdownlist() {
                    jq(".select-drop").hide();
                }


            </script>
        </div>
    </form>
</body>
</html>
