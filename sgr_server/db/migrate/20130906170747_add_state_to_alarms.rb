class AddStateToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :active, :boolean
  end
end
