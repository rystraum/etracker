class AddMakeToUnits < ActiveRecord::Migration
  def change
    add_column :units, :make, :string
  end
end
