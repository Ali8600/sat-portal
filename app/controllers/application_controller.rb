class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(user)
    if user.admin?
      admin_show_path
    elsif user.teacher?
      teacher_show_path
    elsif user.student?
      student_show_path
    else
      # Default redirection path if role is not defined
      super
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :Role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :Role])
  end
end
