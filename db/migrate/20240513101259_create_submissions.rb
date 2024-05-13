class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.datetime :submitted_at
      t.text :content
      t.string :grade

      t.timestamps
    end
  end
end
