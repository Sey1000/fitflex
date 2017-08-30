class CoursesController < ApplicationController
  def index
    @courses = filter_courses(params[:search_day])
    # update_index
  end

  def show
    @course = Course.find(params[:id])
    @studios = Studio.where.not(latitude: nil, longitude: nil).where(id: @course.studio_id)
    @hash = Gmaps4rails.build_markers(@studios) do |studio, marker|
      marker.lat studio.latitude
      marker.lng studio.longitude
    end
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

  def update_index
    day = filter_params[:day]
    category = filter_params[:category]
    level = filter_params[:level]

    @update_courses = filter_courses(day)
    unless level.empty?
      @update_courses = @update_courses.where(level: level)
    end

    respond_to do |format|
      format.html { redirect_to courses_path }
      format.js
    end
  end

  private

  def filter_courses(day)
    filtered_courses = Course.all
    case day
    when 'today'
      filtered_courses = Course.where("start_time > '#{Time.now}' AND start_time < '#{Time.now.end_of_day}'")
    when 'tomorrow'
      filtered_courses = Course.where("start_time > '#{Time.now.end_of_day}' AND start_time < '#{DateTime.tomorrow.end_of_day}'")
    when 'next_seven'
      filtered_courses = Course.where("start_time > '#{Time.now}' AND start_time < '#{(DateTime.now + 7.days).end_of_day}'")
    end
    return filtered_courses
  end

  def courses_params
    params.require(:course).permit(:title, :date, :start_time, :end_time, :cost, :spots, :description, :category, :level, :studio_id)
  end

  def filter_params
    params.require(:search_courses).permit(:day, :category, :level)
  end

  def date_words
    datetime = @course.start_time
    if datetime.today?
      "Today"
    elsif datetime == Date.tomorrow
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
