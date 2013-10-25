class AddActiveToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :Active, :boolean
  end
end
