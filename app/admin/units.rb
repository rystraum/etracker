ActiveAdmin.register Unit do
  menu :priority => 1

  index do
    column :id
    column :asset_tag_no
    column :name
    column :user
    column :location
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
      f.input :aquisition_cost, label: "Acquisition Cost"
    end

    f.buttons
  end
end