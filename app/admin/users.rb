ActiveAdmin.register User, as: "Steward" do
  filter :email
  
  index do
    column :id
    column :email
    default_actions
  end
end