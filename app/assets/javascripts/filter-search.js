$(document).ready(function(){

  // Pick a day
  $(".button-day").on("click", function() {
    $("#chosen-day").html($(this).html());
  });


  // Pick a category
  $(".swiper-slide").on("click", function() {
    $("#chosen-category").html($(this).find(".category-text").html());
  });

  // Pick a level
  $(".button-level").on("click", function() {
    $("#chosen-level").html($(this).html());
  });

  // Pick a distance
  $(".button-distance").on("click", function() {
    $("#chosen-distance").html($(this).html());
  });

  // Reset all filters
  $(".refresh-button").on("click", function() {
    $("#chosen-day").html("");
    $("#chosen-category").html("");
    $("#chosen-level").html("");
    $("#chosen-distance").html("");
  });
});
