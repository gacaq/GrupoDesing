class RemoveRecipeidToVariableRanges < ActiveRecord::Migration
  def up
    remove_column :variable_ranges, :recipe_id
  end

  def down
    add_column :variable_ranges, :recipe_id, :integer
  end
end
