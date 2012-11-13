class Location < ActiveRecord::Base
  attr_accessible :description, :name, :unit_attributes
  has_many :units
  accepts_nested_attributes_for :units
end

