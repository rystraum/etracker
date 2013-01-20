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

    h3 "Maintenance History"
    panel "Maintenance History" do
      table_for unit.service_records.order("date_checked desc") do
        column :date_checked
        column :name
        column :comment
      end
    end

    h3 "Repair Logs"
    panel "Repair Logs" do
      table_for unit.repair_logs.order("pullout desc") do
        column :pullout
        column :returned
        column :supplier_name
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
    end

    f.inputs "Attachment" do
      f.has_many :file_assets do |a|
        a.input :photo, :as => :file, :hint => a.template.image_tag(a.object.photo.url(:medium))
      end
    end

    f.buttons
  end
end