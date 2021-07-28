class CreateWorkPeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :work_periods do |t|
      t.string :title
      t.timestamp :start_time
      t.timestamp :end_time
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
