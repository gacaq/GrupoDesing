class Role < ActiveRecord::Base  
	attr_accessible :name, :description 
  #has_and_belongs_to_many :users, :join_table => :users_roles
  #belongs_to :resource, :polymorphic => true
  
  #scopify
  attr_accessible :role, :description
  has_one :user
  has_one :user_information
  has_many :permissions
end
