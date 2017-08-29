$(document).ready(function() {

    $(".historical-bookings > h2").on("click", function() {
      console.log("hello");
      $(this).next(".row").toggleClass("hidden");
    });
});
