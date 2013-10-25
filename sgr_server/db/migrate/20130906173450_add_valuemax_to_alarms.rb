class AddValuemaxToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :value_max, :float
  end
end
