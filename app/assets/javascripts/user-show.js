$(document).ready(function() {
  $(".tab").on("click", function(e){
    $("a").removeClass("active");
    $(this).addClass("active");
    $(".tab-content").addClass("hidden");
    // Show target tab-content (use class="hidden")
    var id = $(this).data("target");
    $(id).removeClass("hidden");
  });
});
