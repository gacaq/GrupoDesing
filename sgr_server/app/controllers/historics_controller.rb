class HistoricsController < ApplicationController
 
  before_filter :authenticate_user! 

  def index
    @enterprises = Enterprise.includes(:devices).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enterprises }
    end
  end

   def show
    @enterprise = Enterprise.includes(:devices).find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enterprise }
    end
  end

  def start_end
    @datetime_start = "#{params[:start][:day].to_s}-#{params[:start][:month].to_s}-#{params[:start][:year].to_s} #{params[:start][:hour].to_s}:#{params[:start][:minute].to_s}"
    #raise @datetime_start.to_yaml
    @time = params[:option_time]
    @date_start= "#{params[:start][:day].to_s}-#{params[:start][:month].to_s}-#{params[:start][:year].to_s}"
    @datetime_end = "#{params[:end][:day].to_s}-#{params[:end][:month].to_s}-#{params[:end][:year].to_s} #{params[:end][:hour].to_s}:#{params[:end][:minute].to_s}"
    @device_id = params[:device_id]
    @iterator = params[:iterator]
    @data_temp = Work.temperatura.datatime_start_end(params[:device_id], @datetime_start, @datetime_end)
    #raise @data_temp.to_yaml
    @data_hr = Work.humedad_relativa.datatime_start_end(params[:device_id], @datetime_start, @datetime_end)
    
    respond_to do |format|
      format.js
      format.html # show.html.erb
      format.json { render json: @data_temp }
    end

  end

  def random1

    @data = Work.last(1)

    respond_to do |format|
      format.json { render json: @data[0].variable_value}
    end
  end


end
