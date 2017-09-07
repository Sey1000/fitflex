class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def after_sign_in_path_for(resource)
    session[:current_course]  || root_path
  end
end
