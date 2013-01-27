ActiveAdmin.register Unit do
  menu :priority => 1

  index do
    column :id
    column :asset_tag_no
    column :name
    column :location
    column :state
    column :aquisition_cost
    column :aquisition_date
    default_actions
  end

  show do
    h2 "Basic information"
    attributes_table do
      row :id
      row :asset_tag_no
      row :user
      row :location
    end

    h3 "Unit details"
    attributes_table do
      row :serial_no
      row :model
      row :brand
      row :aquisition_date
      row :aquisition_cost
    end

    h3 "Transfer History"
    panel "Transfer History" do
      table_for unit.transfer_records.order("transfer_date desc") do
        column :location_name
        column :transfer_date
      end
    end
  end

  form do |f|
    f.inputs "Associations" do
      f.input :user
      f.input :location
    end

    f.inputs "Details" do
      f.input :asset_tag_no, label: "Asset Tag Number"
      f.input :serial_no, label: "Serial Number"

      f.input :make
      f.input :model
      f.input :brand

      f.input :color

      f.input :aquisition_date, label: "Acquisition Date"
      f.input :aquisition_cost, label: "Acquisition Cost (PHP)"
      f.input :cycle, label: "Maintenance Cycle(days)"
    end

    f.inputs "Attachment" do
      f.has_many :file_assets do |a|
        a.input :photo, :as => :file, :hint => a.template.image_tag(a.object.photo.url(:medium))
      end
    end

    f.buttons
  end
end