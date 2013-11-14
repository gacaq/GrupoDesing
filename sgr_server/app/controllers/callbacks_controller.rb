class CallbacksController < ApplicationController

	skip_before_filter :verify_authenticity_token, :only => [:submit_data]
	
	def submit_data     

		params.delete('controller') 
		params.delete('action')
	    params.each do |p|
	   		Work.create(:variable_id => p[0] , :variable_value => p[1])	     
	    end
	   # response_message = { status: "ok" }
	  #	respond_to do |format|
  		#	format.json { render json: response_message }
		#end
	    @texto =params 
	    render :layout => false

	end
   

	def get_variables
	    @variables = Variable.all 
	    respond_to do |format|
	       format.json { render json: @variables } 
	    end
	end 


	def controller_alarms
		# :user_id viene del js
		@enterprise = Enterprise.includes(:devices).find(params[:user_id])

		@enterprise.devices.each do |d|

			@alarms = d.configuration_set.alarms

			@alarms.each do |a|
				a.activate(d)
			end
		end	

		@texto =params 
	    render :layout => false
	end
end 