class FileAsset < ActiveRecord::Base
  belongs_to :picture, :polymorphic => true
  attr_accessible :photo
  has_attached_file :photo, 
    :styles => { :medium => "238x238>", :thumb => "100x100>"
  }
end
