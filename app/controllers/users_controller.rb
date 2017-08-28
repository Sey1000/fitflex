class UsersController < ApplicationController
  def show #see own profile incl. bookings
    @user = User.find(params[:id])
    @bookings = @user.bookings
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
  end

  private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
