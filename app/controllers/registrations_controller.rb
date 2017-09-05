class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  protected

  def after_sign_up_path_for(resource)
    if params[:user][:role]
      new_studio_path
    else
      super
    end
  end
end
