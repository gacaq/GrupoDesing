class Alarm < ActiveRecord::Base
  attr_accessible :alarm_type, :description, :active, :variable_ranges_attributes, :configuration_set_id
  #belongs_to :recipe
  #belongs_to :device
  has_many :variable_ranges, as: :owner
  belongs_to :configuration_set

  accepts_nested_attributes_for :variable_ranges, :allow_destroy => true


  def activate(device)
    self.variable_ranges.each do |vr|
      last_works = Work.find_with_id_and_variable(device.id, vr.variable.id).last(3)
      last_works.each do |lw|
        self.active = self.active or lw.variable_value > vr.variable.value_max or lw.variable_value < vr.variable.value_min
      end
    end
    self.save
    self.active
  end

  def desactive
  	self.active = false
  	self.save
  end


  def variable_range()
    VariableRange.includes(:variable).find_all_by_owner_id(self.id)
  end

  def variable_ranges_alarms(variable_ranges, alarm_id)
    variable_ranges.each do |vr|
      if vr.owner_id == alarm_id
       VariableRange.includes(:variable).find(vr.id)
      end
    end
  end

  def prueba
    VariableRange.find_all_by_owner_id(self.id)
  end

end


#borrar del modelo reipe_id, device_id, value_min, value_max de la base de datos