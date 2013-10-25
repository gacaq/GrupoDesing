class AddValueminToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :value_min, :float
  end
end
