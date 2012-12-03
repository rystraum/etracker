class ServiceRecord < ActiveRecord::Base
  attr_accessible :comment, :date_checked, :name, :unit_id
  belongs_to :unit
end
