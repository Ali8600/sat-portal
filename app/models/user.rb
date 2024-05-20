class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum Role: %i[ admin teacher student ]

  has_many :courses, foreign_key: :user_id
  has_many :enrollments
  has_many :submissions
  has_many :enrolled_courses, through: :enrollments, source: :course
end

