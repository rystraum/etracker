require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/rmagick_outputter'

# http://hamza.khan-cheema.com/show/34-Generate-a-Barcode-in-Ruby-with-Barby-and-a-small-extension
module Barby
  class CustomRmagickOutputter < RmagickOutputter
    register :to_image_with_data
    def to_image_with_data
      # Make canvas  bigger
      canvas = Magick::ImageList.new
      canvas.new_image(full_width , full_height + 10)
      canvas << to_image
      canvas = canvas.flatten_images
      # Make the text
      text = Magick::Draw.new
      text.font_family = 'Helvetica'
      text.pointsize = 12
      text.gravity = Magick::SouthGravity
      text.annotate(canvas , 0,0,0,0, barcode.data)
      canvas
    end
  end
end

class Unit < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  belongs_to :item
  has_many :logs
  has_many :pullout_logs
  has_many :maintenance_repair_logs
  has_many :transfer_records
  has_many :file_assets, :as => :picture, :dependent => :destroy
  
  accepts_nested_attributes_for :file_assets, :allow_destroy => true
  attr_accessible :file_assets_attributes
  attr_accessible :asset_tag_no, :serial_no, :color
  attr_accessible :make, :model, :brand, :state, :cycle
  attr_accessible :aquisition_cost, :aquisition_date, :condition, :is_active
  attr_accessible :barcode_file_name, :item_id, :user_id, :location_id

	has_attached_file :avatar
	has_attached_file :barcode

  validates_presence_of :user_id, :location_id, :unless => :new_record?
  validates_presence_of :asset_tag_no
  # after_create :generate_barcode_image
  after_create :set_unit_status

  scope :unassigned, where(:user_id => nil)
  scope :assigned, where("user_id IS NOT NULL")
  scope :active, where(:is_active => true)

  scope :logged_in, where(:status_label => "logged in")

  def unassigned?
    return true unless self.item_id.present?
    return false
  end
  def logged_in?
    return true if self.logs.empty? || self.logs.last.status == UnitStatus::In
    return false
  end
  def status_invert
    return UnitStatus::Out if self.logs.empty? || self.logs.last.status == UnitStatus::In
    return UnitStatus::In
  end
  def status_label
    return "logged in" if self.logs.empty? || self.logs.last.status == UnitStatus::In
    return "logged out"
  end
  def to_s
    "#{brand} #{model}"
  end

  def name
    to_s
  end

  def last_maintenance
    maintenance_repair_logs.last
  end

  def is_overdue?
    if last_maintenance.nil?
      false
    else
      last_maintenance.end_date.nil? ? false: last_maintenance.end_date + cycle < Date.today ? true:false
    end
  end

protected
  def generate_barcode_image
	  path = Rails.root.to_s + '/public/system/barcode_images/cgi'
    Dir.mkdir(path) unless File.exists?(path)
	  fname = path + "/#{CGI.escape self.id.to_s}.png"
	  barcode = Barby::Code128B.new self.id
	  outputter = barcode.outputter_for(:to_image_with_data)
	  outputter.height = 55

	  if outputter.to_image_with_data.write(fname)
	    self.barcode = File.new(fname)
	    return self.save(:validate => false)
    else
      return false
    end
  end

  def set_unit_status
    self.state = "Good"
    self.save!
  end
end