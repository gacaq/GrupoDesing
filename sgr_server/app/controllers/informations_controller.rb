class InformationsController < ApplicationController
   before_filter :authenticate_user! 
   def works
   	  @enterprises = Enterprise.includes(:devices).all
   end

end
  