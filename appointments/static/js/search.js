$(document).ready(function() {
  $("#search").click(function getAppointments() {
    var searchQuery = $("#search-query").val();
    // ajax call to the server
    // fetch data based on search query
    $.ajax({
      url: "index.pl",
      data: {q : searchQuery},
      complete: function(resultJSON) {
        $('tbody').html('');
        var response = (resultJSON.responseJSON['result']);
        for (var i = 0; i < response.length; i++) {
            tr = $('<tr/>');
            tr.append("<td>" + response[i].Date + "</td>");
            tr.append("<td>" + response[i].Time + "</td>");
            tr.append("<td>" + response[i].Description + "</td>");
            $('table').append(tr);
        }
      }
    });
  });
});
