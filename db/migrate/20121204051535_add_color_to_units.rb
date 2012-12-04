class AddColorToUnits < ActiveRecord::Migration
  def change
    add_column :units, :color, :string
  end
end
