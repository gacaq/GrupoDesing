class AddLogoImageToEnterprises < ActiveRecord::Migration
  def change
    add_column :enterprises, :logo_image, :string
  end
end
