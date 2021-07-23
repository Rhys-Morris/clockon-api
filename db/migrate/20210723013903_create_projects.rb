class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :color
      t.string :name
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :due_date
      t.boolean :billable
      t.boolean :active
      t.float :hours

      t.timestamps
    end
  end
end
