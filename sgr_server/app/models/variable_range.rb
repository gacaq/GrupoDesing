class VariableRange < ActiveRecord::Base
  attr_accessible :recipe_id, :value_max, :value_min, :variable_id, :alarm_id, :owner_id
  belongs_to :variable
  #belongs_to :recipe
  #belongs_to :alarm
  belongs_to :owner, polymorphic:  true

  validate :min_value_less_than

  def min_value_less_than
  	errors.add(:value_min, "Valor Minimo debe ser menor que el maximo") unless value_max >= value_min
  end
end


#adicionar un campo llamado alarm_id, owner_type(string, index), owner_id(entero,index)