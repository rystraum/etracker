class AuditLog < ActiveRecord::Base
  belongs_to :unit
  belongs_to :auditor, :class_name => "User", :foreign_key => "auditor_id"
  has_many :file_assets, :as => :picture, :dependent => :destroy
  accepts_nested_attributes_for :file_assets, :allow_destroy => true
  
  attr_accessible :comments, :state, :auditor_id
end
