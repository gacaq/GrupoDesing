class RemoveAlarmidToVariableRanges < ActiveRecord::Migration
  def up
    remove_column :variable_ranges, :alarm_id
  end

  def down
    add_column :variable_ranges, :alarm_id, :integer
  end
end
