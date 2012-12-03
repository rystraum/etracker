class CreateRepairLogs < ActiveRecord::Migration
  def change
    create_table :repair_logs do |t|
      t.string :supplier
      t.date :pullout
      t.date :returned
      t.integer :unit_id

      t.timestamps
    end
  end
end
