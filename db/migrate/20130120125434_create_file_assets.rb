class CreateFileAssets < ActiveRecord::Migration
  def change
    create_table :file_assets do |t|
      t.references :unit

      t.timestamps
    end
    add_index :file_assets, :unit_id
  end
end
