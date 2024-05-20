Rails.application.routes.draw do
  devise_for :users, skip: [:sign_up]



  #welcome page routes
  get 'welcome_page', to: 'welcome_page#show', as: 'welcome_page_show'
  root to: 'welcome_page#show'

  #admin-portal routes
  get 'admin', to: 'admin#index', as: 'admin_index'
  get 'admin/users', to: 'admin#users', as: 'admin_users'
  get 'admin/user/:id/edit', to: 'admin#edit_user', as: 'admin_edit_user'
  get 'admin/user/new', to: 'admin#new_user', as: 'admin_new_user'
  put 'admin/createuser', to: 'admin#create_user', as: 'admin_create_user'
  patch 'admin/user/:id/update', to: 'admin#update_user', as: 'admin_update_user'

  #teacher-portal routes
  get  'teacher', to: 'teacher#index', as: 'teacher_index'
  get 'teacher/courses', to: 'teacher#show_courses', as: 'teacher_courses'
  get 'teacher/course/:id', to: 'teacher#show_course', as: 'teacher_course'
  get 'teacher/newcourse', to: 'teacher#new_course', as: 'teacher_new_course'
  post 'teacher/createcourse', to: 'teacher#create_course', as: 'teacher_create_course'
  get 'teacher/course/:id/edit', to: 'teacher#edit_course', as: 'teacher_edit_course'
  patch 'teacher/updatecourse/:id', to: 'teacher#update_course', as: 'teacher_update_course'
  #teacher_course_assignment routes
  get 'teacher/course/:id/showassigments', to: 'teacher#show_assignments', as: 'teacher_show_assigments'
  get 'teacher/course/editassignment/:id', to: 'teacher#edit_assignment', as: 'teacher_edit_assignment'
  patch 'teacher/course/updateassignment/:id', to: 'teacher#update_assignment', as: 'teacher_update_assignment'
  get 'teacher/course/:id/newassignment', to: 'teacher#new_assignment', as: 'teacher_new_assignment'
  post 'teacher/course/:id/createassignment', to: 'teacher#create_assignment', as: 'teacher_create_assignment'
  get 'teacher/course/:course_id/assignment/:assignment_id/show_submissions', to: 'teacher#show_submissions', as: 'teacher_show_assignment_submissions'
  patch 'teacher/assignment/:assignment_id/submission/:submission_id/feedback', to: 'teacher#feedback', as: 'teacher_submission_feedback'
  #teacher_course_students_routes
  get 'teacher/course/:id/students', to: 'teacher#show_students', as: 'teacher_course_students'
  get 'teacher/course/:id/addstudents', to: 'teacher#add_students', as: 'teacher_add_students'
  get 'teacher/course/:course_id/enroll/:user_id', to: 'teacher#enroll', as: 'teacher_enroll_student'
  get 'teacher/course/:course_id/unenroll/:user_id', to: 'teacher#unenroll', as: 'teacher_unenroll_student'

  #student-portal routes
  get 'student', to: 'student#index', as: 'student_index'
  get 'student/course/:id/enroll', to: 'student#enroll', as: 'student_enroll'
  get 'student/course/:id', to: 'student#show_course', as: 'student_course'
  get 'student/course/:course_id/assignment/:assignment_id/addsubmission', to: 'student#add_submission', as: 'student_add_assignment_submission'
  post 'student/course/:course_id/assignment/:assignment_id/create', to: 'student#create_submission', as: 'student_create_submission'



end
