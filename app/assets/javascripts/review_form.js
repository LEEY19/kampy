$(document).ready(function() {

  $("#review_form").hide();
  $("#rating_box").hide();


  $( "#review_user_button" ).click(function() {
    $("#review_form").slideToggle();

  });

  // $("#review_form").on("submit",function(event){
  //   event.preventDefault();
  //   var input = $(this).serialize();


  //   $.ajax ({

  //     type: 'POST',
  //     url: '/reviews',
  //     data: input,
  //     dataType: "json",
  //     success: function(data) {

  //       // $( ".star:eq( 0 )" ).attr('data-id', data);

  //       // $("#rating_box").slideDown(500);

  //       },
  //       error:function(data) {

  //       }
  //   });

  // });

  // $( "#rating_box" ).click(function() {
  //   $( document ).ajaxStop(function() {
  //     location.reload();
  //   });
  // });

});