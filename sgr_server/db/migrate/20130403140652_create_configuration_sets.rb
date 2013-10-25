class CreateConfigurationSets < ActiveRecord::Migration
  def change
    create_table :configuration_sets do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :configuration_sets, :user_id
  end
end
