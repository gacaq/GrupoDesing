class RenameColumnRecipeIdToDevices < ActiveRecord::Migration
  def up
  	rename_column :devices, :recipe_id, :configuration_set_id
  	add_index :devices, :configuration_set_id
  end

  def down
  end
end
