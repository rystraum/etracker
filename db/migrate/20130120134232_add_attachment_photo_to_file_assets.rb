class AddAttachmentPhotoToFileAssets < ActiveRecord::Migration
  def self.up
    change_table :file_assets do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :file_assets, :photo
  end
end
