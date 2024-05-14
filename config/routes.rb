Rails.application.routes.draw do
  devise_for :users

  #profile routes
  get 'profile', to: 'profile#show', as: 'profile_show'

  #admin-portal routes
  get 'admin', to: 'admin#show', as: 'admin_show'
  #teacher-portal routes
  get  'teacher', to: 'teacher#show', as: 'teacher_show'
  #student-portal routes
  get 'student', to: 'student#show', as: 'student_show'

  #
  # # For admin
  # constraints(Role: 'admin') do
  #   root to: 'admin#show'
  # end
  #
  # # For teachers
  # constraints(Role: 'teacher') do
  #   root to: 'teacher#show'
  # end
  #
  # # For students
  # constraints(Role: 'student') do
  #   root to: 'student#show'
  # end

  # Default root for unauthorized users
  root to: 'profile#show'

end
