/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    config.toolbarGroups = [
		{ name: 'document', groups: ['mode', 'document', 'doctools'] },
		{ name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
		{ name: 'clipboard', groups: ['clipboard', 'undo'] },
		{ name: 'forms', groups: ['forms'] },
		{ name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
		{ name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
		{ name: 'links', groups: ['links'] },
		{ name: 'insert', groups: ['insert'] },
		{ name: 'styles', groups: ['styles'] },
		{ name: 'colors', groups: ['colors'] },
		{ name: 'tools', groups: ['tools'] },
		{ name: 'others', groups: ['others'] },
		{ name: 'about', groups: ['about'] }
    ];

    config.removeButtons = 'Superscript,RemoveFormat,Styles,Format,Font,FontSize,Maximize,About,ShowBlocks,BGColor,TextColor,Save,NewPage,Preview,Print,Templates,Find,Replace,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,CreateDiv,Blockquote,Language,Link,Unlink,Anchor,Image,Flash,Table,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,Strike,BidiRtl,BidiLtr,Source,Cut,Copy,Paste,PasteText,PasteFromWord,Subscript,Scayt';
    config.extraPlugins = 'sharedspace';
    config.removePlugins = 'magicline,floatingspace,resize';
    config.autoParagraph = false;
};

function escapeHtml_HiddenChar(string_Input) {  
    try {
        if (typeof string_Input === 'undefined') {
            return "";
        }
        var result_string = string_Input.replace(/[\u200B-\u200D\uFEFF]/g, '');  //  to resolve '?' (bug id -0000170) display in Chart notes - 
        if (typeof result_string === 'undefined') {
            return "";
        }
        return result_string;
    }
    catch (err_Html) {
        alert(err_Html);
    }

} // end of escapeHtml_Chart