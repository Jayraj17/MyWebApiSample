$(document).ready(function () {
    $(".forgot-field").hide();
    $("body").on("click", ".forgot-link", function () {
        if ($(".forgot-field").is(":hidden")) {
            $(".login-field").slideUp();
            $(".forgot-field").slideDown();
        }
    });
    $("body").on("click", ".login-link", function () {
        $(".forgot-field").slideUp();
        $(".login-field").slideDown();
    });
    
});
/* variable is use to check click */
var clickEnable;
/* /variable is use to check click */
//$("body").on("click", ".table-input-field tbody tr", function () {
//    checkPosition();
    
//});
$("body").on("click", ".add-as-main", function () {
    if($(this).children().is(":checked"))
    {
        $(".parent-name").prop('disabled', true);
    }
    else {
        $(".parent-name").prop('disabled', false);
    }

});
$("body").on("click", ".cancel-edit-details", function () {
    clickEnable = false;
    checkPosition();
});
$("body").on("click", ".addnew-input-group", function () {
    clickEnable = false;
    checkPosition();
});
$("body").on("click", ".project-dropdown a", function () {
    var selectThis = $(this);
    selectProject(selectThis);
});
/* click to open change password field */
$("body").on("click", ".changepass", function () {
    $(".changepassword").slideDown();
    $(".newpass").removeClass("show");
});
/* /click to open change password field */
/* check the condition of edit field */
function checkPosition() {
    var clickCheck = clickEnable;
    if (clickCheck == true) {
        return false;
    }
    clickEnable = true;
    var $field = $(".all-master-data");   
    if ($field.css('right') != '0px') {
        
        $(".table-input-field").css("width", "50%");
        $(".all-master-data").css({ "position": "relative", "right": "0px" });
        $(".addnew-input-group").addClass("disabled");
        
    }
    else {
        $(".table-input-field").css("width", "100%");
        $(".all-master-data").css({ "position": "absolute", "right": "-1000px" });
        $(".addnew-input-group").removeClass("disabled");
        clickEnable = false;
    }
}
/* /check the condition of edit field */
/* calculate the height */
function containerHeight() {
    var calHeight = $(window).height() - $("header").outerHeight() - $(".footer").outerHeight();
    $(".nav-side-menu").css("height", +calHeight + "px");
    $(".right-container").css("height", +calHeight + "px");
    var settingRight = $(".right-container").outerHeight() - $(".headline").outerHeight(true) - 10;
    $(".settings-right").css("height", +settingRight + "px");
}
/* /calculate the height */
/* assign tree height */
function treemenuHeight() {
    var calHeight = $(window).height() - $("header").outerHeight() - $(".footer").outerHeight() - 20;
    $(".tree-menu").css("height", +calHeight + "px");
}
/* /assign tree height */
/* select project dropdown */
function selectProject(selectThis) {
    var projectName = selectThis.html();
    $(".project-name").html(projectName);
}
$(".accordion").on("click", ".panel-heading", function () {
    $(this).find("i.indicator").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
});
$("body").on("click", ".sub-menu li", function () {
    $(this).children().find(".left-arrow").toggleClass('glyphicon-menu-right glyphicon-menu-down');
});
$("body").on("click", ".parent-menu a", function () {
    $(this).find(".right-arrow").toggleClass('glyphicon-menu-down glyphicon-menu-up');
});

$(window).load(function () {
    containerHeight();
    treemenuHeight();
});
$(window).resize(function () {
    containerHeight();
    treemenuHeight();
});


// Added by kushal  on 07-03-2016
function encryptByDES(message, key) {    
    var keyHex = CryptoJS.enc.Utf8.parse(key);
    var encrypted = CryptoJS.DES.encrypt(message, keyHex, {
        mode: CryptoJS.mode.ECB,
        padding: CryptoJS.pad.Pkcs7
    });
    return encrypted.toString();
}

function decryptByDES(ciphertext, key) {
    var keyHex = CryptoJS.enc.Utf8.parse(key);
    var decrypted = CryptoJS.DES.decrypt({
        ciphertext: CryptoJS.enc.Base64.parse(ciphertext)
    }, keyHex, {
        mode: CryptoJS.mode.ECB,
        padding: CryptoJS.pad.Pkcs7
    });
    return decrypted.toString(CryptoJS.enc.Utf8);
}