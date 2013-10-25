class Enterprise < ActiveRecord::Base
  attr_accessible :name, :logo_image, :enterprise_category_id, :address, :telephone

  has_many :users
  has_many :user_informations
  has_many :devices
  belongs_to :enterprise_category

  default_scope order: 'enterprises.created_at ASC'

  mount_uploader :logo_image, SimpleUploader

  validates :name, :presence => true
  validates :enterprise_category_id, :presence => true
  validates :address, :presence => true
  validates :telephone, :presence => true

end 
 