class CreateTransferRecords < ActiveRecord::Migration
  def change
    create_table :transfer_records do |t|
      t.string :name
      t.date :transfer_date
      t.integer :unit_id
      t.integer	:location_id

      t.timestamps
    end
  end
end
