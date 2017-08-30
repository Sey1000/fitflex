$(document).ready(function(){

  // Pick a day
  $(".button-day").on("click", function() {
    $("#chosen-day").html($(this).text());
  });


  // Pick a category
  $(".swiper-slide").on("click", function() {
    $("#chosen-category").html($(this).attr('data-category'));
  });

  // Pick a level
  $(".button-level").on("click", function() {
    $("#chosen-level").html($(this).text());
  });

  // Pick a distance
  $(".button-distance").on("click", function() {
    $("#chosen-distance").html($(this).text());
  });

  // Reset all filters
  $(".reset-filters").on("click", function() {
    $("#chosen-day").text("all days");
    $("#chosen-category").text("all categories");
    $("#chosen-level").text("all levels");
    $("#chosen-distance").text("any distance");
  });
});
