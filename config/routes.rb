Rails.application.routes.draw do
  devise_for :users, skip: [:sign_up]


  #profile routes
  get 'profile', to: 'profile#show', as: 'profile_show'

  #admin-portal routes
  get 'admin', to: 'admin#index', as: 'admin_index'
  get 'admin/manageusers', to: 'admin#manageusers', as: 'admin_manageusers'
  get 'admin/manageuser/:id/edit', to: 'admin#manageuser', as: 'admin_edit_manageuser'
  get 'admin/newuser', to: 'admin#newuser', as: 'admin_new_user'
  put 'admin/createuser', to: 'admin#createuser', as: 'admin_create_user'
  patch 'admin/manageuser/:id', to: 'admin#manageuserupdate', as: 'admin_update_manageuser'

  #teacher-portal routes
  get  'teacher', to: 'teacher#index', as: 'teacher_index'
  get 'teacher/showcourses', to: 'teacher#showcourses', as: 'teacher_show_courses'
  get 'teacher/showcourse/:id', to: 'teacher#showcourse', as: 'teacher_show_course'
  get 'teacher/newcourse', to: 'teacher#newcourse', as: 'teacher_new_course'
  post 'teacher/createcourse', to: 'teacher#createcourse', as: 'teacher_create_course'
  get 'teacher/course/:id/edit', to: 'teacher#editcourse', as: 'teacher_edit_course'
  patch 'teacher/updatecourse/:id', to: 'teacher#updatecourse', as: 'teacher_update_course'
  #teacher_course_assignment routes
  get 'teacher/course/:id/showassigments', to: 'teacher#showassignments', as: 'teacher_show_assigments'
  get 'teacher/course/editassignment/:id', to: 'teacher#editassignment', as: 'teacher_edit_assignment'
  patch 'teacher/course/updateassignment/:id', to: 'teacher#updateassignment', as: 'teacher_update_assignment'
  get 'teacher/course/:id/newassignment', to: 'teacher#newassignment', as: 'teacher_new_assignment'
  post 'teacher/course/:id/createassignment', to: 'teacher#createassignment', as: 'teacher_create_assignment'

  #student-portal routes
  get 'student', to: 'student#index', as: 'student_index'

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
