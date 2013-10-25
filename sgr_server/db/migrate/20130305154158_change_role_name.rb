class ChangeRoleName < ActiveRecord::Migration
  def up
  	rename_column :roles, :role, :name
  end

  def down
  	rename_column :roles, :name, :role
  end
end
