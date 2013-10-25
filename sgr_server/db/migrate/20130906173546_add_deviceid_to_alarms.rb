class AddDeviceidToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :device_id, :integer
  end
end
