class CoursesController < ApplicationController
  def index
    @courses = filter_courses(params[:search_day])
    # update_index
  end

  def show
    @course = Course.find(params[:id])
    @user = current_user

    la = Geocoder.search('85.214.132.117').first.latitude
    lo = Geocoder.search('85.214.132.117').first.longitude
    @json_distance = distance_api_call(la,lo)
    @request = request.location
    @json_driving = duration_api_call(la,lo,"driving")
    @json_walking = duration_api_call(la,lo,"walking")
    @json_bicycle = duration_api_call(la,lo,"bicycling")
    @json_transit = duration_api_call(la,lo,"transit")
    @studios = Studio.where.not(latitude: nil, longitude: nil).where(id: @course.studio_id)
    @hash = Gmaps4rails.build_markers(@studios) do |studio, marker|
      marker.lat studio.latitude
      marker.lng studio.longitude
      marker.infowindow render_to_string(partial: "/courses/map_box", locals: { studio: studio })
    end

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
   json =  JSON.parse(form)
   json["rows"][0]["elements"][0]["distance"]["text"]
  end

  def json_parsing_duration(url)
    form = open(url).read
    json = JSON.parse(form)
    json["rows"][0]["elements"][0]["duration"]["text"]
  end

  def duration_api_call(la,lo,mode)
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{la},#{lo}&destinations=#{URI.encode(@course.studio.address)}&mode=#{mode}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    json_parsing_duration(url)
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








