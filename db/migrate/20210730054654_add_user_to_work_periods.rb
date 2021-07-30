class AddUserToWorkPeriods < ActiveRecord::Migration[6.1]
  def change
    add_reference :work_periods, :user, null: false, foreign_key: true
  end
end
