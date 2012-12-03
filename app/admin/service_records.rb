ActiveAdmin.register ServiceRecord do
  index do
  	column :comment
  	column :date_checked
  	column :name
  	column :unit_id
  end
end
