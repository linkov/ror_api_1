jQuery(document).ready(function($) {

  $('.best_in_place').bind("ajax:success", function () {$(this).closest('td').effect('highlight',{color: '#0000FF'}); });
  $('.slider-container .best_in_place').bind("ajax:success", function () {$(this).closest('div').effect('highlight',{color: '#0000FF'}); });

    function toggleVariants() {

        if ($( "#question_slider_type_id" ).find('option:selected').html() == "choosomatic") {

            $(".suggestions").parent().parent().show();
            $(".suggestions").show();

        } else {

            $(".suggestions").parent().parent().hide();
            $(".suggestions").hide();
        }
    };

    toggleVariants();

    $( "#question_slider_type_id" ).change(function() {

        toggleVariants();

    });

});
