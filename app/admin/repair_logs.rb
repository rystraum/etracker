ActiveAdmin.register RepairLog do
  menu :priority => 2

	index do
	  column "Start of Repair Date", :pullout
	  column "Date returned from Repair", :returned
	  column :supplier
	  column :unit
    default_actions
	end
end