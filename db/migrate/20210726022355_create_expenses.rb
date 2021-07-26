class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :cost
      t.date :date
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
