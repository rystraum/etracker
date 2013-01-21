class CreatePulloutLogs < ActiveRecord::Migration
  def change
    create_table :pullout_logs do |t|
      t.references :unit
      t.integer :requesting_user_id
      t.integer :authorizing_user_id
      t.text :purpose
      t.date :pullout_date
      t.date :return_date

      t.timestamps
    end
    add_index :pullout_logs, :unit_id
  end
end
