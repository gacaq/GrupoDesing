class AddFieldToVariableRanges < ActiveRecord::Migration
  def change
    add_column :variable_ranges, :alarm_id, :integer
    add_column :variable_ranges, :owner_type, :string
    add_column :variable_ranges, :owner_id, :integer
  end
end
