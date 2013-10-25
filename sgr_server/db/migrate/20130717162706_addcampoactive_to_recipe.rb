class AddcampoactiveToRecipe < ActiveRecord::Migration
  def up
  	add_column :recipes, :active, :boolean
  end

  def down
  end
end
