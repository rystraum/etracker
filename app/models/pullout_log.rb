class PulloutLog < ActiveRecord::Base
  after_create :set_unit_for_pullout
  belongs_to :unit
  belongs_to :requesting_user, :class_name => "User", :foreign_key => "requesting_user_id"
  belongs_to :authorizing_user, :class_name => "User", :foreign_key => "authorizing_user_id"
  attr_accessible :authorizing_user_id, :pullout_date, :purpose, :requesting_user_id, :return_date, :unit_id

protected
  def set_unit_for_pullout
    unit = self.unit
    unit.state = "Pending for Pullout"
    unit.save!
  end
end
