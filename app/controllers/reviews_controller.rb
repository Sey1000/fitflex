class ReviewsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @date_words = date_words
    @review = Review.new
  end

  def create
    @course = Course.find(params[:course_id])
    @date_words = date_words
    @review = Review.new(reviews_params)
    @review.course = @course
    @review.user = current_user
    if @review.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :course_id)
  end

  # TEMPORARILY COPY PASTED
  def date_words
    datetime = @course.start_time
    if datetime.today?
      "Today"
    elsif datetime.to_date == Date.tomorrow
      "Tomorrow"
    elsif datetime < (DateTime.now + 7.day)
      days = datetime.day - DateTime.now.day
      if days == -1
        "Yesterday"
      elsif days < 0
        "#{-days} days ago"
      else
        "#{days} days"
      end
    end
  end
end
