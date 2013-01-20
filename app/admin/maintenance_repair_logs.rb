ActiveAdmin.register MaintenanceRepairLog do  
  member_action :return, :method => :put do
    log = MaintenanceRepairLog.find(params[:id])
    log.end_date = Date.today
    log.unit.state = "Good"
    log.unit.save!

    redirect_to :action => :show
  end

  member_action :cancel, :method => :put do
    log = MaintenanceRepairLog.find(params[:id])
    log.unit.state = "Overriden"
    log.unit.save!
    log.end_date = Date.today
    redirect_to :action => :show
  end

  index do
    column "Unit" do |log|
      log.unit.name
    end
    column :supplier
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
    f.input :unit
    f.input :supplier
    f.input :start_date, label: "Start Date"
  end
end
