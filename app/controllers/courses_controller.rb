class CoursesController < ApplicationController
  def index
    @courses = filter_courses(params[:search_day])
    # update_index
  end

  def show
    @course = Course.find(params[:id])
    @user = current_user
    @studios = Studio.where.not(latitude: nil, longitude: nil).where(id: @course.studio_id)
    @hash = Gmaps4rails.build_markers(@studios) do |studio, marker|
      marker.lat studio.latitude
      marker.lng studio.longitude
    end
    la = Geocoder.search('85.214.132.117').first.latitude
    lo = Geocoder.search('85.214.132.117').first.longitude
    @json = distance_api_call(la,lo)
    @request = request.location
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
    # unless level.empty?
    #   @update_courses = @update_courses.where(level: level)
    # end

    if level.present? && category.empty?
      @update_courses = @update_courses.where(level: level)
    elsif level.empty? && category.present?
      @update_courses = @update_courses.where(category: category)
    elsif level.present? && category.present?
      @update_courses = @update_courses.where({category: category, level: level})
    else
      @update_courses = filter_courses(day)
    end

    respond_to do |format|
      format.html { redirect_to courses_path }
      format.js
    end
  end

  private

# Google Map
  require 'open-uri'

  def distance_api_call(la, lo)
   url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{la},#{lo}&destinations=#{URI.encode(@course.studio.address)}"
   form = open(url).read
   return JSON.parse(form)
  end

  def distance_from_api(json)

  end

# Filter Courses
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
    params.require(:search_courses).permit(:day, :category, :level, :distance)
  end

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








