ActiveAdmin.register AuditLog do
  form do |f|
    f.inputs "Details" do
      f.input :unit
      f.input :state, :as => :select, :collection => AuditStatus::Status
      f.input :comments
      f.input :auditor_id, :as => :hidden, :value => proc{current_user.id}.call
    end

    f.inputs "Attachment" do
      f.has_many :file_assets do |a|
        a.input :photo, :as => :file, :hint => a.template.image_tag(a.object.photo.url(:medium))
      end
    end

    f.buttons
  end
end
