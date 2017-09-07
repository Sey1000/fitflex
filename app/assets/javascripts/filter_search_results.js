$(document).ready(function(){

  var buttonFilters = ['day', 'category', 'level', 'price_cents'];

    // filter search results for buttons
    buttonFilters.forEach( function(filter){
      $(".button-"+ filter).on("click", function(e) {
        $("#search_courses_" + filter).attr('value', $(this).attr("data-" + filter));
        $("#search_courses").submit();
      });
    });

    // filter search results for sliders
      $("#distance-slider").change(function(){
        $("#slider-distance-form").attr('value', $(this).val());
        $("#search_courses").submit();
      });

  // Reset to default filter values when clicking on button-filter in filter-container
  buttonFilters.forEach( function(filter) {
    $("#chosen-" + filter).on("click", function() {
      $("#search_courses_" + filter).attr('value', "");
      $("#search_courses").submit();
    });
  });

  // Reset to default filter values when clicking on slider-filter in filter-container
    $("#chosen-distance").on("click", function() {
      $("#slider-distance-form").attr('value', "");
      $("#search_courses").submit();
    });

  // Reset button-filters on reset-button click
  buttonFilters.forEach( function(filter){
    $(".refresh-button").on("click", function() {
      $("#search_courses_" + filter).attr('value', $(this).attr("data-" + filter));
      $("#search_courses").submit();
    });
  });

  // Reset slider-filters on reset-button click
    $(".refresh-button").on("click", function() {
      $("#slider-distance-form").attr('value', "");
      $("#search_courses").submit();
    });
  });
