$(document).ready(function() {

    $(".historical-bookings > h2").on("click", function() {
      $(this).next(".row").toggleClass("hidden");
    });
});
