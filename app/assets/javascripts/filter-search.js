$(document).ready(function(){

  $(".button-day").on("click", function() {
    $("#chosen-day").html($(this).text());
  });
});
