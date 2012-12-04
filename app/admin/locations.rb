ActiveAdmin.register Location do
  menu :priority => 1, :label => "Locations"
  
  form do |f|
    f.inputs "Location" do 
      f.input :name
      f.input :description
    end

    f.has_many :units do |unit_f|
      unit_f.input :_destroy, as: :boolean, label: "Destroy?" if !unit_f.object.nil?
      unit_f.input :user
      unit_f.input :asset_tag_no, label: "Asset Tag Number"

      unit_f.input :serial_no, label: "Serial Number"
      unit_f.input :model
      unit_f.input :brand

      unit_f.input :aquisition_date, label: "Acquisition Date"
      unit_f.input :aquisition_cost, label: "Acquisition Cost"
    end

    f.buttons
  end

  show do
    attributes_table do
      row :name
      row :description
    end
    
    table_for location.units do
      column :id
      column :asset_tag_no
      column :aquisition_date
      column "Actions" do |unit|
        link_to "Show", [:admin, unit]
      end
    end
  end
end
