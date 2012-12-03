ActiveAdmin.register RepairLog do
	index do
	  column :pullout
	  column :returned
	  column :supplier
	  column :unit_id
	end
end
