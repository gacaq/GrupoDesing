// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require script
//= require jquery_ujs
//= require_tree .
(function ($){
    $.fn.regexMask = function (mask) {
        if (!mask) {
            throw 'mandatory mask argument missing';
        } else if (mask == 'float-ptbr') {
            mask = /^((\d{1,3}(\.\d{3})*(((\.\d{0,2}))|((\,\d*)?)))|(\d+(\,\d*)?))$/;
        } else if (mask == 'float-enus') {
            mask = /^((\d{1,3}(\,\d{3})*(((\,\d{0,2}))|((\.\d*)?)))|(\d+(\.\d*)?))$/;
        } else if (mask == 'integer') {
            mask = /^\d+$/;
        } else {
            try {
                mask.test("");
            } catch(e) {
                throw 'mask regex need to support test method';
            }
        }
        $(this).keypress(function (event) {
            if (!event.charCode) return true;
            var part1 = this.value.substring(0,this.selectionStart);
            var part2 = this.value.substring(this.selectionEnd,this.value.length);
            if (!mask.test(part1 + String.fromCharCode(event.charCode) + part2))
                return false;
        });
    };
})(jQuery);