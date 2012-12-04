class ServiceRecord < ActiveRecord::Base
  attr_accessible :comment, :date_checked, :name, :unit_id, :present_day_value
  belongs_to :unit
end
