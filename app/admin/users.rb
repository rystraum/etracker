ActiveAdmin.register User, as: "Steward" do
  filter :email

  index do
    column :id
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Auth details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.inputs "Personal details" do
      f.input :name
      f.input :contact_number
    end
    f.buttons
  end
end