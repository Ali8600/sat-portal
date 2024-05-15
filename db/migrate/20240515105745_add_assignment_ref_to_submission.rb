class AddAssignmentRefToSubmission < ActiveRecord::Migration[7.0]
  def change
    add_reference :submissions, :assignments,  foreign_key: true
  end
end
