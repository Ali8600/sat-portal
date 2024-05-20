class WelcomePageController < ApplicationController

  def show
    @courses = Course.all
    # render json: @courses.as_json(only: [:id, :title, :description])
  end

end
