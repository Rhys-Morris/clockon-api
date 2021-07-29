class AddInvoicedToWorkPeriods < ActiveRecord::Migration[6.1]
  def change
    add_column :work_periods, :invoiced, :boolean
  end
end
