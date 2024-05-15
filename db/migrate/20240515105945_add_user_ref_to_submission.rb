class AddUserRefToSubmission < ActiveRecord::Migration[7.0]
  def change
    add_reference :submissions, :users,  foreign_key: true
  end
end
