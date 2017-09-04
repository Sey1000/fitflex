class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @studio = Studio.find(params[:id])
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studios_params)
    @studio.save
  end

  def edit
    @studio = Studio.find(params[:id])
  end

  def update
    @studio = Studio.find(params[:id])
    @studio.update(studios_params)
  end

  def destroy
    @studio = Studio.find(params[:id]).destroy
  end

  private

  def studios_params
    params.require(:studio).permit(:name, :description, :address, :telephone)
  end
end
