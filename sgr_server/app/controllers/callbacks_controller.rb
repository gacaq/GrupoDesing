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
			
			#  @last_works = Work.find_with_id_and_variable(d.id, 1).last(3) # inicialmente se hace de forma manual
			# active_alarm = false

 		# 	@last_works.each do |w|
  	# 			active_alarm = active_alarm or w.active?(w.variable.variable_ranges.value_min, w.variable.variable_ranges.value_max)
			# end

			# if active_alarm
			# 	@alarms = d.configuration_sets.recipes.alarms
			# 	@alarms.each do |a|
			# 		@last_works.each do |w|
			# 			if w.variable_value < a.variable_ranges.value_min or w.variable_value > a.variable_ranges.value_max
			# 				a.activate
			# 			end
			# 		end
			# 	end
 		# 	end
		end	

		@texto =params 
	    render :layout => false
	end
end 