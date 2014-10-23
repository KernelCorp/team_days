$(function(){
    $('input[name="order[client_phone]"]').each(function(){
        $(this)
            .inputmasks({
                inputmask: {
                    definitions: {
                        '#': {
                            validator: "[0-9]",
                            cardinality: 1
                        }
                    },
                    clearIncomplete: true,
                    showMaskOnHover: false,
                    autoUnmask: true
                },
                match: /[0-9]/,
                replace: '#',
                list: $.masksSort($.masksLoad("/assets/vendor/inputmask-multi/dev/phone-codes.json"), ['#'], /[0-9]|#/, "mask"),
                listKey: "mask"
            })
            .on('focusin', function(){
                if( !this.value ) this.value = '7'
            });
    });
});