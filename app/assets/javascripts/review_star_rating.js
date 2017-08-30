$(document).ready(function() {
  $('.review-star').click(function() {
    $('.review-star').removeClass('fa-star');
    $('.review-star').addClass('fa-star-o');

    $(this).removeClass('fa-star-o');
    $(this).addClass('fa-star');
    $(this).prevAll().removeClass('fa-star-o');
    $(this).prevAll().addClass('fa-star');

    var realRating = $(this).data('rating');
    $('#hidden-review-rating').val(realRating);
  });
});