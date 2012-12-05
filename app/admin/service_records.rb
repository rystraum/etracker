ActiveAdmin.register ServiceRecord do
  menu :priority => 2, :label => "Maintenance Records"

  index do
  	column :comment
  	column :date_checked
  	column :name
  	column :unit
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :unit
      f.input :date_checked
      f.input :present_day_value
    end

    f.inputs "Details" do
      f.input :name, label: "Auditor's name"
      f.input :comment
    end

    f.buttons
  end
end