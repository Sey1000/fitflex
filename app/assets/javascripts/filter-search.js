$(document).ready(function(){


  // if (
  //   console.log('h')
  //   $(".chosen-filters-container").addClass("hidden");
  // }

  // Pick a day
  $(".filter-container").on("click", "li", function() {
    // if ($(".filter-container").hasClass("active")) {
      console.log("toggle");
      if( $(this).hasClass("active") ) {
        $(".tab-content").toggleClass("hidden");
      }
      else {
        $(".tab-content").removeClass("hidden");
      }
    // else
      // $(".")
    // }
  });

  $(".button-day").on("click", function() {
    $("#chosen-day").html("<p class='chosen-item'>x    " + $(this).text() + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
    $(".tab-content").toggleClass("hidden");
  });

  // Pick a category
  // $(".filter-container li:nth-child(2)").on("click", function() {
  //   $(".tab-content").toggleClass("hidden", "slow");
  // });
  $(".swiper-slide").on("click", function() {
    $("#chosen-category").html("<p class='chosen-item'>x    " + $(this).find(".category-text").text() + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
    $(".tab-content").toggleClass("hidden");
  });

  // Remove chosen-filters on filter-click
  $("#chosen-category, #chosen-day, #chosen-level, #chosen-distance, #chosen-cost").on("click", function() {
    $(this).html("");
    if ($(this).parent().find(".chosen-item").size() == 0 ) {
      $(".chosen-filters-container").addClass("hidden");
    }
  });

  // Pick a level
  // $(".filter-container li:nth-child(3)").on("click", function() {
  //   $(".tab-content").toggleClass("hidden", "slow");
  // });
  $(".button-level").on("click", function() {
    $("#chosen-level").html("<p class='chosen-item'>x    " + $(this).text() + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
    $(".tab-content").toggleClass("hidden");
  });

  // Pick a distance
  // $(".filter-container li:nth-child(4)").on("click", function() {
  //   $(".tab-content").toggleClass("hidden", "slow");
  // });
  $(".button-distance").on("click", function() {
    $("#chosen-distance").html("<p class='chosen-item'>x    " + $(this).text() + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
    $(".tab-content").toggleClass("hidden");
  });

  //Pick price

  $(".button-cost").on("click", function() {
    $("#chosen-cost").html("<p class='chosen-item'>x    " + $(this).text() + "</p>");
    $(".chosen-filters-container").removeClass("hidden");
    $(".tab-content").toggleClass("hidden");
  });


  // Reset all filters
  $(".refresh-button").on("click", function() {
    $("#chosen-day").html("");
    $("#chosen-category").html("");
    $("#chosen-level").html("");
    $("#chosen-distance").html("");
    $("#chosen-cost").html("");
    $(".chosen-filters-container").toggleClass("hidden");
  });

});
