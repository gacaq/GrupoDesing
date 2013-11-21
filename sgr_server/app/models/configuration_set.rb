class ConfigurationSet < ActiveRecord::Base
  attr_accessible :name, :recipe_attributes, :user_id, :alarms_attributes
  has_one :recipe, :dependent => :delete
  belongs_to :user
  has_many :devices
  has_many :alarms, :dependent => :delete_all

  validates :name, :uniqueness => true


  accepts_nested_attributes_for :recipe, :allow_destroy => true
  accepts_nested_attributes_for :alarms, :allow_destroy => true

end