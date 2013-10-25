class Work < ActiveRecord::Base
  attr_accessible :device_id, :name, :variable_id, :variable_value
  belongs_to :variable
  belongs_to :device

  scope :temperatura, where(:variable_id => 1) 
  scope :humedad_relativa, where(:variable_id => 2)
  
  def self.datatime_start_end(device_id, datetime_start, datetime_end)
	  where("device_id=? AND created_at>=? AND created_at<=?", device_id, datetime_start, datetime_end)
  end

  def active?(value_min, value_max)
  	self.variable_value > value_max or self.variable_value < value_min
  end

  def self.find_with_id_and_variable(device_id, variable_id)
    where("device_id=? AND variable_id=?", device_id, variable_id) 
  end
  
end
