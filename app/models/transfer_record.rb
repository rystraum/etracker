class TransferRecord < ActiveRecord::Base
  attr_accessible :name, :transfer_date, :unit_id, :location_id
  belongs_to :location
  belongs_to :unit
end
