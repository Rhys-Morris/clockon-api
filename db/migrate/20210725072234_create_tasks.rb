class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :due_date
      t.float :estimated_hours
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
