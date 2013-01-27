ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span "Welcome to Active Admin. This is the default dashboard page."
    #    small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
    #  end
    #end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    #section do
    #  panel "Overdue Maintenance/Repair" do
    #    table_for MaintenanceRepairLog.all do
    #      column "Unit" do |log| log.unit.name if log.is_overdue? end
    #      column "Personnel" do |log| log.personnel.name if log.is_overdue? end
    #      column "Supplier" do |log| log.supplier if log.is_overdue? end
    #      column "Start Date" do |log| log.start_date if log.is_overdue? end
    #      column "Expected Date of Return" do |log| log.start_date + log.duration if log.is_overdue? end
    #      column "Number of Days Late" do |log| log.overdue if log.is_overdue? end
    #    end
    #  end
    #end

    section do
      panel "Needed Maintenance/Repair" do
        table_for Unit.all do
          column "Name" do |unit| unit.name if unit.is_overdue? end
          column "Last Date of Maintenance" do |unit| unit.last_maintenance.end_date if unit.is_overdue? end
          column "Last Maintained by" do |unit| unit.last_maintenance.personnel.name if unit.is_overdue? end
        end
      end
    end 
    
  end # content
end
