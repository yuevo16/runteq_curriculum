class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content, null: false
      t.integer :user_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
