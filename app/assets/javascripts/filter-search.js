$(document).ready(function(){

  // Pick a day
  $(".filter-container").on("click", "li", function() {
    // if ($(".filter-container").hasClass("active")) {
      if( $(this).hasClass("active") ) {
        $(".tab-content").toggleClass("hidden");
      }
      else {
        $(".tab-content").removeClass("hidden");
      }
    });

  $(".button-day").on("click", function() {
    $("#chosen-day").html("<p class='chosen-item'>x    " + $(this).text() + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
    $(".tab-content").toggleClass("hidden");
  });

  // Pick a category
  $(".swiper-slide").on("click", function() {
    $("#chosen-category").html("<p class='chosen-item'>x    " + $(this).find(".category-text").text() + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
    $(".tab-content").toggleClass("hidden");
  });

  // Remove chosen-filters on filter-click
  $("#chosen-category, #chosen-day, #chosen-level, #chosen-distance, #chosen-price_cents").on("click", function() {
    $(this).html("");
    if ($(this).parent().find(".chosen-item").size() == 0 ) {
      $(".chosen-filters-container").addClass("hidden");
    }
  });

  // Pick a level
  $(".button-level").on("click", function() {
    $("#chosen-level").html("<p class='chosen-item'>x    " + $(this).text() + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
    $(".tab-content").toggleClass("hidden");
  });

  // Pick a distance

  $("#distance-slider").change(function(){
    $("#chosen-distance").html("<p class='chosen-item'>x    " + $(this).val() + " km" + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
  });

  $("#distance-slider").slider({
    formatter: function(value) {
      return value;
    }
  });

  //Pick a price

  $("#price_cents-slider").change(function(){
    $("#chosen-price_cents").html("<p class='chosen-item'>x    " + $(this).val()/100 + " €" + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
  });

  $("#price_cents-slider").slider({
    formatter: function(value) {
      return value/100 + "€";
    }
  });


  // Reset all filters
  $(".refresh-button").on("click", function() {
    $("#chosen-day").html("");
    $("#chosen-category").html("");
    $("#chosen-level").html("");
    $("#chosen-distance").html("");
    $("#chosen-price_cents").html("");
    $(".chosen-filters-container").toggleClass("hidden");
  });

});
