class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # protect_from_forgery with: :null_session
  def after_sign_in_path_for(user)
    if user.admin?
      admin_index_path
    elsif user.teacher?
      teacher_index_path
    elsif user.student?
      student_index_path
    else
      # Default redirection path if role is not defined
      super
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :Role, :id, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:id,:name, :email, :id, :password, :Role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :Role, :id])
    devise_parameter_sanitizer.permit(:id )

  end
end
