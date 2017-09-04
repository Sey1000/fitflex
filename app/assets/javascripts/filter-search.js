// This javascript file is to do the animations around the display of the filters - not handling the ajax calls

$(document).ready(function(){

  // show filter possibilities if filter type inactive - if already active, hide it
  $(".filter-container").on("click", "li", function() {
      if( $(this).hasClass("active") ) {
        $(".tab-content").toggleClass("hidden");
      }
      else {
        $(".tab-content").removeClass("hidden");
      }
    });

  var buttonFilters = ['day', 'category', 'level'],
    sliderFilters = ['distance', 'price_cents'],
    allFilters = buttonFilters.concat(sliderFilters),
    // units = ["km", "€"],
    // conversion = [1, 100];

  buttonFilters.forEach( function(filter){
    $(".button-" + filter).on("click", function() {
      $("#chosen-" + filter).html("<p class='chosen-item'>x    " + $(this).text() + "</p>");
      $(".chosen-filters-container").removeClass("hidden");
      $(".tab-content").toggleClass("hidden");
    });
  });


  $("#distance-slider").change(function(){
    $("#chosen-distance").html("<p class='chosen-item'>x    " + $(this).val() + " km" + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
  });

    $("#distance-slider").slider({
      formatter: function(value) {
        return value;
      }
    });

  $("#price_cents-slider").change(function(){
    $("#chosen-price_cents").html("<p class='chosen-item'>x    " + $(this).val() + " €" + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
  });

  $("#price_cents-slider").slider({
    formatter: function(value) {
      return value;
    }
  });


  allFilters.forEach( function(filter) {
  // Remove chosen-filters on filter-click
    $("#chosen-" + filter).on("click", function() {
      $(this).html("<p class='chosen-item'>x    Any " + filter + "</p>");
    });

  // Reset all filters
    $(".refresh-button").on("click", function() {
      $("#chosen-" + filter).html("<p class='chosen-item'>x    Any " + filter + "</p>");
    });
  });
});
