class UserInformation < ActiveRecord::Base
  attr_accessible :nombre, :apellido, :cedula, :enterprise_id, :role_id,:email 
  
  belongs_to :enterprise
  belongs_to :role
  has_many :recipes    
  has_many :historics 
 
end
