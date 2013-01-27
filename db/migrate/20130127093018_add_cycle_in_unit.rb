class AddCycleInUnit < ActiveRecord::Migration
  def change
    add_column :units, :cycle, :integer
  end
end
