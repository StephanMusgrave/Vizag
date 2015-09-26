window.setTimeout(function() {
    $(".alert").fadeTo(900, 0).slideUp(900, function(){
        $(this).remove();
    });
}, 5000);
