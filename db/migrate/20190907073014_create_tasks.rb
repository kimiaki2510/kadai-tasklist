class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :status
      t.string :content
      t.string :user_id

      t.timestamps
    end
  end
end
