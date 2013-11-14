class ConfigurationSet < ActiveRecord::Base
  attr_accessible :name, :recipe_attributes, :user_id, :alarms_attributes
  has_one :recipe
  belongs_to :user
  has_many :devices
  has_many :alarms


  accepts_nested_attributes_for :recipe, :allow_destroy => true
  accepts_nested_attributes_for :alarms, :allow_destroy => true

end