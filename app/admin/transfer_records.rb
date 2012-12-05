ActiveAdmin.register TransferRecord do
	index do
  	column :name
  	column :transfer_date
  	column :unit
  	column :location
    default_actions
  end

  form do |f|
    f.inputs "Transfer Record" do
      f.input :unit
      f.input :location
      f.input :name, label: "Received by"
      f.input :name, label: "Authorized by"
      f.input :transfer_date
    end

    f.buttons
  end
end