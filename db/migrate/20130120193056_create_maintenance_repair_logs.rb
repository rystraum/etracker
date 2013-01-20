class CreateMaintenanceRepairLogs < ActiveRecord::Migration
  def change
    create_table :maintenance_repair_logs do |t|
      t.string :supplier
      t.string :type
      t.integer :personnel_id
      t.date :start_date
      t.date :end_date
      t.references :unit

      t.timestamps
    end
  end
end
