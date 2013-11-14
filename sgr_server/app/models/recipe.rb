class Recipe < ActiveRecord::Base
  attr_accessible :recipe_type, :variable_ranges_attributes, :configuration_set_id
  has_many :variable_ranges, as: :owner
  belongs_to :configuration_set


  accepts_nested_attributes_for :variable_ranges, :allow_destroy => true

  #scope :alarms, where(:recipe_type => "alarm")
  #scope :set_points, where(:recipe_type => "set_point")

  #borrar active de la base de datos

   def variable_range_recipe()
    VariableRange.includes(:variable).find_all_by_owner_id(self.id)
  end

end
 