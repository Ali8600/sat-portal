class AdminUsersController < ApplicationController
  before_action :authenticate_user!, :authorize_admin_access

  def show
     @user_item = User.all
     # render template: "views/profile/show"
  end

  # def portfolio_params
  #   params.require(:portfolio).permit(:title, :subtitle, :body)
  # end
end
