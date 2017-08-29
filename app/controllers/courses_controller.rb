class CoursesController < ApplicationController
  def index
    @courses = filter_courses
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

  def filter_courses
    filtered_courses = Course.all
    case params[:search_day]
    when 'today'
      filtered_courses = Course.all.select { |cs| cs.start_time.to_date.today? }
    when 'tomorrow'
      filtered_courses = Course.all.select { |cs| (cs.start_time.to_date - Time.now.to_date).to_i == 1 }
    when 'next_seven'
      filtered_courses = Course.all.select { |cs| (cs.start_time.to_date - Time.now.to_date).to_i > 1 && (cs.start_time.to_date - Time.now.to_date).to_i < 8 }
    end
    return filtered_courses
  end

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
