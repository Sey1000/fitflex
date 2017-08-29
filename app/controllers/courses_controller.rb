class CoursesController < ApplicationController
  def index
    raise
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    # @average_rating = average_rating
    @date_words = date_words
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(courses_params)
    redirect_to course_path(@course)
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(courses_params)
    redirect_to courses_path
  end

  def destroy
    @destroy = Course.find(params[:id]).destroy
  end

  private
  def courses_params
    params.require(:course).permit(:title, :date, :start_time, :end_time, :cost, :spots, :description, :category, :level, :studio_id)
  end

  def date_words
    datetime = @course.start_time
    if datetime.today?
      "Today"
    elsif datetime == Date.tomorrow
      "Tomorrow"
    elsif datetime < (DateTime.now + 7.day)
      days = datetime.day - DateTime.now.day
      "#{days} days"
    end
  end
end
