class Location < ActiveRecord::Base
  attr_accessible :description, :name, :units_attributes
  has_many :units
  accepts_nested_attributes_for :units
end