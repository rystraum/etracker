class AddPresentDayValueToServiceRecords < ActiveRecord::Migration
  def change
    add_column :service_records, :present_day_value, :float
  end
end
