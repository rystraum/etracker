class MaintenanceRepairLog < ActiveRecord::Base
  after_create :set_unit_under_maintenance
  attr_accessible :end_date, :personnel_id, :start_date, :supplier, :type, :unit_id

  belongs_to :unit
  belongs_to :personnel, :class_name => "User", :foreign_key => "personnel_id"

protected
  def set_unit_under_maintenance
    unit = self.unit
    unit.state = "Under Maintenance"
    unit.save!
  end
end
