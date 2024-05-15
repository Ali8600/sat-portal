class AddCourseRefAssigment < ActiveRecord::Migration[7.0]
  def change
    add_reference :assignments, :course,  foreign_key: true

  end
end
