class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!, except: [:top, :about]
before_action :correct_users,only: [:show]

def after_sign_in_path_for(resource)
  user_path(current_user.id)
end



  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def correct_users
        @user = User.find(params[:id])
      unless @user.id == current_user.id
       redirect_to user_path(current_user.id)
      end
  end

end
