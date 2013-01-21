ActiveAdmin.register PulloutLog do
  member_action :pullout, :method => :put do
    log = PulloutLog.find(params[:id])
    log.unit.state = "Pulled Out"
    log.unit.save!
    log.pullout_date = Date.today
    log.save!
    redirect_to :action => :show
  end

  member_action :return, :method => :put do
    log = PulloutLog.find(params[:id])
    log.unit.state = "Available"
    log.unit.save!
    log.return_date = Date.today
    log.save!
    redirect_to :action => :show
  end

  index do 
    column "Unit" do |log|
      log.unit.name
    end
    column :purpose
    column "Requesting User" do |log|
      log.requesting_user.name unless log.requesting_user.nil?
    end
    column "Authorizing User" do |log|
      log.authorizing_user.name unless log.authorizing_user.nil?
    end
    column :pullout_date
    column :return_date
    column "" do |log|
      link_to "Pullout", [:pullout, :admin, log], :method => :put
    end
    column "" do |log|
      link_to "Return", [:return, :admin, log], :method => :put
    end
  end

  form do |f|
    f.inputs "Input" do
      f.input :unit
      f.input :requesting_user_id, :as => :hidden, :value => proc{current_user.id}.call
    end
    f.buttons
  end
end
