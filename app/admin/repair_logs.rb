ActiveAdmin.register RepairLog do
  menu :priority => 2

	index do
	  column :pullout
	  column :returned
	  column :supplier
	  column :unit
    default_actions
	end
end
