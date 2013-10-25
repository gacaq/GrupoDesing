class RemoveColumnUserIdToRecipes < ActiveRecord::Migration
  def up
  	remove_column :recipes, :user_id
  end

  def down
  end
end
