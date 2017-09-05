class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new]

  def show
    @studio = Studio.find(params[:id])
    @users = User.where(studio_id: params[:id].to_i).where(role: "instructor")
    @owner = current_user if current_user && current_user.studio == @studio && current_user.role == "owner"
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studios_params)
    @studio.save
    current_user.studio = @studio
    current_user.save
    if @studio.save && current_user.save
      redirect_to studio_path(@studio)
    else
      render 'studios/new'
    end
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
    params.require(:studio).permit(:name, :description, :address, :telephone, :photo)
  end
end
