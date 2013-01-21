class TransferRecord < ActiveRecord::Base
  attr_accessible :name, :transfer_date, :unit_id, :location_id
  belongs_to :location
  belongs_to :unit
  delegate :name, to: :location, prefix: true
  default_scope includes(:location)

  #before_save :transfer_date_check
  #after_save :update_unit_location

  def update_unit_location
    unit.location = location
    unit.save
  end

  def transfer_date_check
    transfer_date = DateTime.now if transfer_date.blank?
  end
end