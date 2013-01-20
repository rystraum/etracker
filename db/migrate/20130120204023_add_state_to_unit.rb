class AddStateToUnit < ActiveRecord::Migration
  def change
    add_column :units, :state, :string
  end
end
