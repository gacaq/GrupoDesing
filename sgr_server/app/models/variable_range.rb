class VariableRange < ActiveRecord::Base
  attr_accessible :recipe_id, :value_max, :value_min, :variable_id, :alarm_id, :owner_id
  belongs_to :variable
  #belongs_to :recipe
  #belongs_to :alarm
  belongs_to :owner, polymorphic:  true
end


#adicionar un campo llamado alarm_id, owner_type(string, index), owner_id(entero,index)