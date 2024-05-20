class StudentController < ApplicationController
  before_action :authenticate_user!, :authorize_student_access
  def index
     @courses = Course.all
  end

  def enroll
    @course = Course.find(params[:id])
    current_user.enrollments.create(course: @course)
    redirect_to student_index_path, notice: 'Course Enrolled Successfully.'
  end

  def show_course
    @course = Course.find(params[:id])
    @assignments = @course.assignments.all
  end

  def add_submission
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:assignment_id])
    @submission = Submission.new
    @submission.user_id = current_user.id
    @submission.assignment_id = params[:assignment_id]
  end

  def create_submission
    @assignment = Assignment.find(params[:assignment_id])
    @submission = Submission.new(params[:submission].permit(:content))
    @submission.assignment_id = params[:assignment_id]
    @submission.user_id = current_user.id
    if @submission.save
      redirect_to student_course_path(params[:course_id]), notice: 'Submitted Successfully.'
    else
      redirect_to student_course_path(params[:course_id]), notice: 'Submission Failed.'
    end
  end

  def authorize_student_access
    # Check if the current user is an admin
    return if current_user.student? || current_user.admin?

    # Redirect non-admin users to a different path (e.g., root_path)
    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end
end
