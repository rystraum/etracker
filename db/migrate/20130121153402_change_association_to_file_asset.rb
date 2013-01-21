class ChangeAssociationToFileAsset < ActiveRecord::Migration
  def change
    rename_column :file_assets, :unit_id, :picture_id
    add_column :file_assets, :picture_type, :string
  end
end
