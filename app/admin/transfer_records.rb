ActiveAdmin.register TransferRecord do
	index do
  	column :name
  	column :transfer_date
  	column :unit
  	column :location
    default_actions
  end
end
