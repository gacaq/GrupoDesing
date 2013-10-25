class AddDeviceCategoryIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :device_category_id, :integer
    add_index :devices, :device_category_id
  end
end
