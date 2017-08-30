class CoursesController < ApplicationController
  def index
    @courses = filter_courses
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

  private

  require 'open-uri'

  def distance_api_call(la, lo)
   url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{la},#{lo}&destinations=#{URI.encode(@course.studio.address)}"
   form = open(url).read
   return JSON.parse(form)
  end

  def distance_from_api(json)

  end

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
