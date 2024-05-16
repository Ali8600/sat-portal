class TeacherController < ApplicationController
  before_action :authenticate_user!, :authorize_teacher_access

  def index
  end
  #Course Action Controller Region
  def showcourses
    if current_user.teacher?
      @course = current_user.courses
      end
  end

  def showcourse
    if current_user.teacher?
      @course = current_user.courses.find(params[:id])
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

  #Assignment's Action Controller Region

  def showassignments
    if current_user.teacher?
      @course = Course.find(params[:id])
      @assignments = @course.assignments.all
    end
  end

  def editassignment
    if current_user.teacher?
      @assignment = Assignment.find(params[:id])
    end
  end

  def updateassignment
    if current_user.teacher?
      @course = Course.find(params[:id])
      @assignment = Assignment.find(params[:id])
    end
      if @assignment.update(params[:assignment].permit(:title, :description, :deadline, :course_id))
        redirect_to teacher_show_assigments_path(@assignment.course.id), notice: 'Assignment was successfully updated.'
    end
  end

  def newassignment
    if current_user.teacher?
      @course = Course.find(params[:id])
      @assignment = Assignment.new
      @assignment.course_id = @course.id
    end
  end

  def createassignment
    if current_user.teacher?
      @course = Course.find(params[:id])
      @assignment = Assignment.new(params[:assignment].permit(:title, :description, :deadline, :course_id))
      @assignment.course_id = @course.id
      if @assignment.save
        redirect_to teacher_show_assigments_path, notice: 'Assignment was successfully created.'
      end
    end
  end


  def authorize_teacher_access
    # Check if the current user is an admin
    return if current_user.teacher? || current_user.admin?

    # Redirect non-admin users to a different path (e.g., root_path)
    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end
end
