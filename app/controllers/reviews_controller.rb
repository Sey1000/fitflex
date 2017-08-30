class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.save
  end

  private

  def reviews_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :course_id)
  end
end
