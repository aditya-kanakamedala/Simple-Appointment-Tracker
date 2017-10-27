$(document).ready(function() {
  // initialize date and time pickers
  $("#date").datepicker({ dateFormat: "yy-mm-dd" ,
                             minDate: new Date(),
                             beforeShow:function(input) {
                               $(input).css({
                                   "position": "relative",
                                   "z-index": 999999
                               });
                           }
                          });
  $("#time").timepicker();

  $("#new").click(function() {
    var buttonText = $("#new").text();
    if( buttonText === "New") {
      toggleHidden();
    }
    else if( buttonText === "Add") {
      var date = $("#date").val();
      var time = $("#time").val();
      var desc = $("#desc").val();
      validateAndSubmit(date, time, desc);
    }
  });

  $("#cancel").click(function() {
    $("#new").text("New");
    $("#cancel").hide();
    $("#date-div").hide();
    $("#time-div").hide();
    $("#description-div").hide();
    $("#error-div").hide();
  });

  function toggleHidden() {
    $("#new").text('Add');
    // toggle();
    $("#cancel").show();
    $("#date-div").show();
    $("#time-div").show();
    $("#description-div").show();
  };

  function validateAndSubmit(date, time, desc) {
    // one of the fields is not set
    if(!date || !time || !desc) {
      $("#error-div").html('');
      if(!date) {
        $("#error-div").append("<p>Please enter a valid date!</p>");
      }
      if(!time) {
        $("#error-div").append("<p>Please enter a time for the appointment</p>");
      }
      if(!desc) {
        $("#error-div").append("<p>Please enter a description for appointment</p>");
      }
      $("#error-div").show();
    }
    else {
      $("#appointment").submit();
    }
  }

});
