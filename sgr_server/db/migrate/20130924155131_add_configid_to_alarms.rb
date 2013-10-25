class AddConfigidToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :configuration_set_id, :integer
  end
end
