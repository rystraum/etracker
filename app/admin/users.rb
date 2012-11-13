ActiveAdmin.register User do
  filter :email

  index do
    column :id
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Auth details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.inputs "Personal details" do
      f.input :name
      f.input :contact_number
    end

    f.has_many :units do |unit_f|
      unit_f.input :_destroy, as: :boolean, label: "Destroy?" if !unit_f.object.nil?
      unit_f.input :location
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
    h3 "Basic Details"
    attributes_table do
      row :id
      row :email
      row :name
      row :contact_number
    end
    
    h3 "Units assigned to #{user.name} (#{user.email})"
    table_for user.units do
      column :id
      column :asset_tag_no
      column :aquisition_date
      column "Actions" do |unit|
        link_to "Show", [:admin, unit]
      end
    end
  end
end