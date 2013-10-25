class User < ActiveRecord::Base
  attr_accessible :nombre, :apellido, :enterprise_id, :role_id, :cedula, :email, :telephone

  #scope :principal_user, where(:principal => true)
  
  belongs_to :enterprise
  belongs_to :role
  has_many :configuration_sets   
  has_many :historics

  #rolify   
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def self.principal_user
    find_by_principal(true)
  end


end