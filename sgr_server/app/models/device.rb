class Device < ActiveRecord::Base
  attr_accessible :name, :enterprise_id, :device_category_id, :configuration_set_id, :active
  has_many :works  
  #has_many :alarms
  belongs_to :enterprise 
  belongs_to :configuration_set
  belongs_to :device_category
  default_scope order: 'devices.created_at ASC'

  def configuration(configuration_set_id)
    ConfigurationSet.includes(:alarms).find(configuration_set_id)
  end
 
end
