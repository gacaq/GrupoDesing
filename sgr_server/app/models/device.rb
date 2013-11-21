class Device < ActiveRecord::Base
  attr_accessible :name, :enterprise_id, :device_category_id, :configuration_set_id, :active
  has_many :works, :dependent => :delete_all
  #has_many :alarms
  belongs_to :enterprise 
  belongs_to :configuration_set
  belongs_to :device_category
  default_scope order: 'devices.created_at ASC'

  def configuration(configuration_set_id)
    ConfigurationSet.includes(:alarms, :recipe).find(configuration_set_id)
  end

  def AplicarSet(configuration_set_name)
    if self.configuration_set
      self.configuration_set.destroy
    end
    configuration = ConfigurationSet.find_by_name(configuration_set_name)

    ###Creacion de la configuracion espejo
    mirror_configuration = ConfigurationSet.new()
    mirror_configuration.name = configuration.name + " " + self.name
    mirror_configuration.save()
    self.configuration_set = mirror_configuration
    self.save()
    ####################################################################

    #####Creacion del recipe espejo con todos sus variable ranges
    mirror_recipe = Recipe.new()
    mirror_recipe.configuration_set_id = mirror_configuration.id
    mirror_recipe.save()
    configuration.recipe.variable_ranges.each do |vr|
      mirror_variable = VariableRange.new()
      mirror_variable.owner_id = mirror_recipe.id
      mirror_variable.value_max = vr.value_max
      mirror_variable.value_min = vr.value_min
      mirror_variable.owner_type = "Recipe"
      mirror_variable.variable_id = vr.variable_id
      mirror_variable.save()
    end
    ####################################################################

    ########Creacion de alarmas espejo
    configuration.alarms.each do |alarm|
      mirror_alarm = Alarm.new()
      mirror_alarm.active = false
      mirror_alarm.alarm_type = alarm.alarm_type
      mirror_alarm.configuration_set_id = mirror_configuration.id
      mirror_alarm.description = alarm.description
      mirror_alarm.save()

      alarm.variable_ranges.each do |vr|
        mirror_variable = VariableRange.new()
        mirror_variable.owner_id = mirror_alarm.id
        mirror_variable.value_max = vr.value_max
        mirror_variable.value_min = vr.value_min
        mirror_variable.owner_type = "Alarm"
        mirror_variable.variable_id = vr.variable_id
        mirror_variable.save()
      end
    end
  end

 
end
