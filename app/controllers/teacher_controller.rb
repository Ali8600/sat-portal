class TeacherController < ApplicationController
  before_action :authenticate_user!, :authorize_teacher_access

  def index
  end
  #Course Action Controller Region
  def show_courses
    if current_user.teacher?
      @course = current_user.courses
      end
  end

  def show_course
    if current_user.teacher?
      @course = current_user.courses.find(params[:id])
    end
  end
  def edit_course
    @course = Course.find(params[:id])
  end

  def update_course
    @course = Course.find(params[:id])
    if @course.update(params[:course].permit(:title, :description))
      redirect_to teacher_courses_path, notice: 'User was successfully updated.'
    end
  end
  def new_course
    if current_user.teacher?
      @course = Course.new
    end
  end

  def create_course
    @course = Course.new( params.require(:course).permit(:title, :description, :user_id))
    @course.user_id = current_user.id
    if @course.save
      redirect_to teacher_courses_path, notice: 'User was successfully created.'
    else
      redirect_to teacher_index_path, alert: 'Failed to create course.'
    end
  end

  #Assignment's Action Controller Region

  def show_assignments
    if current_user.teacher?
      @course = Course.find(params[:id])
      @assignments = @course.assignments.all
    end
  end

  def edit_assignment
    if current_user.teacher?
      @assignment = Assignment.find(params[:id])
    end
  end

  def update_assignment
    if current_user.teacher?
      @course = Course.find(params[:id])
      @assignment = Assignment.find(params[:id])
    end
      if @assignment.update(params[:assignment].permit(:title, :description, :deadline, :course_id))
        redirect_to teacher_show_assigments_path(@assignment.course.id), notice: 'Assignment was successfully updated.'
    end
  end

  def new_assignment
    if current_user.teacher?
      @course = Course.find(params[:id])
      @assignment = Assignment.new
      @assignment.course_id = @course.id
    end
  end

  def create_assignment
    if current_user.teacher?
      @course = Course.find(params[:id])
      @assignment = Assignment.new(params[:assignment].permit(:title, :description, :deadline, :course_id))
      @assignment.course_id = @course.id
      if @assignment.save
        redirect_to teacher_show_assigments_path, notice: 'Assignment was successfully created.'
      end
    end
  end

  def show_submissions
    if current_user.teacher?
      @assignment = Assignment.find(params[:assignment_id])
      @submissions = @assignment.submissions.all

    end
  end

  def feedback
    if current_user.teacher?
      @submission = Submission.find(params[:submission_id])
      @assignment = @submission.assignment
      @course = @assignment.course
      if @submission.update(params[:submission].permit(:grade))
        redirect_to teacher_show_assignment_submissions_path(@course.id,@assignment.id), notice: 'Feedback Updated'
      end
    end
  end
  #Student Region

  def show_students
    if current_user.teacher?
      @course = Course.find(params[:id])
      @students = User.joins(:enrollments).where(enrollments: { course_id: @course.id })
    end
  end

  def add_students
    if current_user.teacher?
      @course = Course.find(params[:id])
      @students = User.where.not(id: @course.enrollments.pluck(:user_id)).where(Role: 'student')
    end
  end

  def enroll
    @course = Course.find(params[:course_id])
    @student = User.find(params[:user_id])
    @student.enrollments.create(course_id: @course.id)
    redirect_to teacher_course_students_path(@course.id), notice: 'Student Enrolled Successfully.'
  end

  def unenroll
    @course = Course.find(params[:course_id])
    @student = User.find(params[:user_id])
    Enrollment.find_by(user_id: @student.id, course_id: @course.id).destroy
    redirect_to teacher_course_students_path(@course), notice: 'Student Un-enrolled Successfully.'

  end
  def authorize_teacher_access
    # Check if the current user is an admin
    return if current_user.teacher? || current_user.admin?

    # Redirect non-admin users to a different path (e.g., root_path)
    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end
end
