class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.datetime :sent_at
      t.datetime :read_at

      t.timestamps
    end
  end
end
