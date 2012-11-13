class AddAssetTagNumberToUnit < ActiveRecord::Migration
  def change
    add_column :units, :asset_tag_no, :string
  end
end
