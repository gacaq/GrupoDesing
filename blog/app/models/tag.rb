class Tag < ActiveRecord::Base
  belongs_to :post
  attr_accessible :name, :id, :post_id, :created_at, :updated_at
end
