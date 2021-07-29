class AddBillableRateToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :billable_rate, :float
  end
end
