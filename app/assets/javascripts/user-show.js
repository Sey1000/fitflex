$(document).ready(function() {
    $(".historical-bookings").on("click", function() {
      $(this).next().toggleClass("hidden");
    });
});
