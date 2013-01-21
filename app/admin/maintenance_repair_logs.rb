ActiveAdmin.register MaintenanceRepairLog do  
  member_action :return, :method => :put do
    log = MaintenanceRepairLog.find(params[:id])
    log.unit.state = "Good"
    log.unit.save!
    
    log.end_date = Date.today
    log.save!

    redirect_to :action => :show
  end

  member_action :cancel, :method => :put do
    log = MaintenanceRepairLog.find(params[:id])
    log.unit.state = "Overriden"
    log.unit.save!
    
    log.end_date = Date.today
    log.save!
    
    redirect_to :action => :show
  end

  index do
    column "Unit" do |log|
      log.unit.name
    end
    column :supplier
    column :personnel
    column :start_date
    column :end_date
    column "" do |log|
      link_to "Return", [:return, :admin, log], :method => :put
    end
    column "" do |log|
      link_to "Cancel", [:cancel, :admin, log], :method => :put
    end
  end

  form do |f|
    f.inputs "Input" do
      f.input :unit
      f.input :supplier
      f.input :start_date
      f.input :personnel_id, :as => :hidden, :value => proc{current_user.id}.call
    end

    f.buttons
  end
end 
