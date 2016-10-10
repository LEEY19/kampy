$(document).ready(function() { 


  $("#request_form").on("submit",function(event){
    event.preventDefault();
    event.stopImmediatePropagation();
    var input = $(this).serialize();

    $.ajax ({

      type: 'POST',
      url: '/requests',
      data: input,
      dataType: "script",
      success: function(data) {
          console.log("akhsdfhkjadshfhsdajkfh");
        },
        error:function(data) {
          
        }
    });

  });

  $(".confirm").on("submit",function(event){
    event.preventDefault();
    event.stopImmediatePropagation();
    $.ajax ({

      type: 'GET',
      url: $(this).attr("action"),
      dataType: "script",
      success: function(data) {

        },
        error:function(data) {

        }
    });

  });

  $(".decline").on("submit",function(event){
    event.preventDefault();
    event.stopImmediatePropagation();
    $.ajax ({

      type: 'GET',
      url: $(this).attr("action"),
      dataType: "script",
      success: function(data) {

        },
        error:function(data) {

        }
    });

  });

});