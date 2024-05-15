class TeacherController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def showcourses
    if current_user.teacher?
      @course = current_user.courses
      end
  end

  def editcourse
    @course = Course.find(params[:id])
  end

  def updatecourse
    @course = Course.find(params[:id])
    if @course.update(params[:course].permit(:title, :description))
      redirect_to teacher_show_courses_path, notice: 'User was successfully updated.'
    end
  end
  def newcourse
    if current_user.teacher?
      @course = Course.new
    end
  end

  def createcourse
    @course = Course.new( params.require(:course).permit(:title, :description, :user_id))
    @course.user_id = current_user.id
    if @course.save
      redirect_to teacher_show_courses_path, notice: 'User was successfully created.'
    else
      redirect_to teacher_index_path, alert: 'Failed to create course.'
    end
  end

  # def portfolio_params
  #   params.require(:portfolio).permit(:title, :subtitle, :body)
  # end
end
