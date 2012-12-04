class RepairLog < ActiveRecord::Base
  attr_accessible :pullout, :returned, :supplier, :unit_id
  belongs_to :unit

  def supplier_name
    supplier
  end
end
