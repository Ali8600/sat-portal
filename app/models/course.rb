class Course < ApplicationRecord
  belongs_to :user
  has_many :assignments
  has_many :enrollments
  has_many :users, through: :enrollments
end
