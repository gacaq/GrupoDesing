class RemoveActiveFromRecipe < ActiveRecord::Migration
  def up
    remove_column :recipes, :Active
  end

  def down
    add_column :recipes, :Active, :boolean
  end
end
