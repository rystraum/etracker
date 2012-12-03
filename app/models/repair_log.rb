class RepairLog < ActiveRecord::Base
  attr_accessible :pullout, :returned, :supplier, :unit_id
  belongs_to :unit
end
