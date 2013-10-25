class AddSomeFieldsToSomeTables < ActiveRecord::Migration
  def change
  	add_column :enterprises, :address, :string
  	add_column :enterprises, :telephone, :string
  	add_column :users, :principal, :boolean
  end
end
