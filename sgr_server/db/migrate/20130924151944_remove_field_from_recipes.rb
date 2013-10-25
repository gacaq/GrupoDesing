class RemoveFieldFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :active
  end

  def down
    add_column :recipes, :active, :boolean
  end
end
