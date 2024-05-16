class StudentController < ApplicationController
  before_action :authenticate_user!
  def index
     @courses = Course.all
  end

end
