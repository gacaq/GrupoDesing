class RemoveFieldFromAlarms < ActiveRecord::Migration
  def up
    remove_column :alarms, :recipe_id
    remove_column :alarms, :device_id
    remove_column :alarms, :value_min
    remove_column :alarms, :value_max
  end

  def down
    add_column :alarms, :value_max, :float
    add_column :alarms, :value_min, :float
    add_column :alarms, :device_id, :integer
    add_column :alarms, :recipe_id, :integer
  end
end
