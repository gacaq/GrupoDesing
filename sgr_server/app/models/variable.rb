class Variable < ActiveRecord::Base
  attr_accessible :description, :name, :variable_type
  has_many :works
  has_many :variable_ranges
end
