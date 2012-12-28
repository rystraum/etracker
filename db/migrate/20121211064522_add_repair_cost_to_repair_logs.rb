class AddRepairCostToRepairLogs < ActiveRecord::Migration
  def change
    add_column :repair_logs, :repair_cost, :float
  end
end
