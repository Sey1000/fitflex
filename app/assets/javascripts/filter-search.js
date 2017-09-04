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
    units = ["km", "€"],
    conversion = [1, 100];

  buttonFilters.forEach( function(filter){
    $(".button-" + filter).on("click", function() {
      $("#chosen-" + filter).html("<p class='chosen-item'>x    " + $(this).text() + "</p>");
      $(".chosen-filters-container").removeClass("hidden");
      $(".tab-content").toggleClass("hidden");
    });
  });

  for (i = 0; i<3; i++) {
    $("#" + sliderFilters[i] +"-slider").change(function(){
      $("#chosen-" + sliderFilters[i]).html("<p class='chosen-item'>x    " + $(this).val() + " " + units[i] / conversion[i] + "</p>");
      $(".chosen-filters-container").removeClass("hidden");
    });
    $("#" + sliderFilters[i] +"-slider").slider({
    formatter: function(value) {
      return value / conversion[i];
    }
  });

  }

  allFilters.forEach( function(filter) {
  // Remove chosen-filters on filter-click
    $("#chosen-" + filter).on("click", function() {
      $(this).html("Any " + filter);
    });

  // Reset all filters
    $(".refresh-button").on("click", function() {
      $("#chosen-" + filter).html("Any " + filter);
    });
  });
});
