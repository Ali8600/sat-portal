class AdminController < ApplicationController
  before_action :authenticate_user!, :authorize_admin_access

  def index
    @user_item = User.all
    @user = User.new
  end

  def show

     # render template: "views/profile/show"
  end

  def manageusers
    @user_item = User.all
  end

  def newuser
    @user_item = User.new
  end

  def createuser
    @user_item = User.new(params[:user].permit(:email, :name, :Role, :password, :password_confirmation))
    if @user_item.save
      redirect_to admin_manageusers_path, notice: 'User was successfully created.'
    end
  end
  def manageuser
    @user_item = User.find(params[:id])
  end

  def manageuserupdate
    @user = User.find(params[:id])
    if @user.update(params[:user].permit(:email, :name, :Role))
      redirect_to admin_manageusers_path, notice: 'User was successfully updated.'
    end
  end

  def authorize_admin_access
    # Check if the current user is an admin
    return if current_user.admin?

    # Redirect non-admin users to a different path (e.g., root_path)
    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end
  # def portfolio_params
  #   params.require(:portfolio).permit(:title, :subtitle, :body)
  # end
end
