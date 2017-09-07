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

  var buttonFilters = ['day', 'category', 'level', 'price_cents'];

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
      value: 10,
      formatter: function(value) {
        return value;
      }
    });


  buttonFilters.forEach( function(filter) {
  // Remove chosen-filters on filter-click
    $("#chosen-" + filter).on("click", function() {
      $(this).html("");
    });

  // Reset all filters
    $(".refresh-button").on("click", function() {
      $("#chosen-" + filter).html("");
    });

    // Slider Filter
    $("#chosen-distance").on("click", function() {
      $(this).html("");
    });

  // Reset all filters
    $(".refresh-button").on("click", function() {
      $("#chosen-distance").html("");
    });

  });
});
