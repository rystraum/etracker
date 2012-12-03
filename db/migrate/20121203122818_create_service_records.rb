class CreateServiceRecords < ActiveRecord::Migration
  def change
    create_table :service_records do |t|
      t.string :name
      t.text :comment
      t.date :date_checked
      t.integer :unit_id

      t.timestamps
    end
  end
end
