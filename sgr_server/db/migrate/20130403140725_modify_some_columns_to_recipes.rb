class ModifySomeColumnsToRecipes < ActiveRecord::Migration
  def up
  	add_column :recipes, :configuration_set_id, :integer
  	add_index :recipes, :configuration_set_id
  	rename_column :recipes, :product, :recipe_type
  	remove_column :recipes, :name
  end

  def down
  end
end
