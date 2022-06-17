jQuery(document).ready(function($) {

  // $( document ).ajaxSuccess(function( event, request, settings ) {
  //
  //   debugger;
  //
  // });


  $(document).on("ajax:succes", "a", function(data){
    debugger;
    $(data.id).remove();
});

  $(".action-suggestions").click(function(){

    const actionContainer = $(this).parent().parent().next(".question-actions-container");
    actionContainer.find("div[class*='action-container']").hide();
    actionContainer.toggle();
    actionContainer.find(".suggestions-action-container").toggle();

  });

  $(".action-slider").click(function(){

    const actionContainer = $(this).parent().parent().next(".question-actions-container");
    actionContainer.find("div[class*='action-container']").hide();
    actionContainer.toggle();
    actionContainer.find(".slider-action-container").toggle();

  });


  $(".action-translations").click(function(){

    const actionContainer = $(this).parent().parent().next(".question-actions-container");
    actionContainer.find("div[class*='action-container']").hide();
    actionContainer.toggle();
    actionContainer.find(".translations-action-container").toggle();

  });

});
