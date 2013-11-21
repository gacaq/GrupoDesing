class ConfigurationSetsController < ApplicationController
  before_filter :authenticate_user!
  # GET /configuration_sets
  # GET /configuration_sets.json
  def index
    @enterprises = Enterprise.includes(:devices).all
    if current_user.role_id == 1
      render "su_index"
    elsif current_user.role_id == 2
      render "admin_index"
    end
  end

  # GET /configuration_sets/1
  # GET /configuration_sets/1.json
  def show
    @configuration_set = ConfigurationSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @configuration_set }
    end
  end

  # GET /configuration_sets/new
  # GET /configuration_sets/new.json
  def new
    @configuration_set = ConfigurationSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @configuration_set }
    end
  end

  # GET /configuration_sets/1/edit
  def edit
    @configuration_set = ConfigurationSet.find(params[:id])
  end

  # POST /configuration_sets
  # POST /configuration_sets.json
  def create
    respond_to do |format|
      if (params[:commit] == "Guardar")
        @configuration_set = ConfigurationSet.new(params[:configuration_set])
        if @configuration_set.save

          device = Device.find(params[:device_id])
          device.configuration_set_id = @configuration_set.id
          configuration = ConfigurationSet.includes(:alarms).find(@configuration_set.id)
          configuration.alarms do |a|
            a.active = false
            #raise a.active.to_yaml
            a.save
          end
          device.save

          format.html { redirect_to configuration_sets_path, notice: 'Configuration set was successfully created.' }
          format.json { render json: @configuration_set, status: :created, location: @configuration_set }
        else
          @enterprises = Enterprise.includes(:devices).all
          format.html { render "su_index" }
          format.json { render json: @configuration_set.errors, status: :unprocessable_entity }
        end
      else
        if (ConfigurationSet.find_by_name(params[:configuration_set][:name]))
          device = Device.find(params[:device_id])
          device.AplicarSet(params[:configuration_set][:name])
          format.html { redirect_to configuration_sets_path, notice: 'Configuration set was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to configuration_sets_path, notice: 'No existe ningun Set de Configracion con el nombre ingresado' }
          format.json { head :no_content }
        end
      end
    end

  end

  # PUT /configuration_sets/1
  # PUT /configuration_sets/1.json
  def update
    @configuration_set = ConfigurationSet.find(params[:id])

    respond_to do |format|
      if (params[:commit] == "Guardar")
        if @configuration_set.update_attributes(params[:configuration_set])
          format.html { redirect_to configuration_sets_path, notice: 'Configuration set was successfully updated.' }
          format.json { head :no_content }
        else
          @enterprises = Enterprise.includes(:devices).all
          format.html { render "su_index" }
          format.json { render json: @configuration_set.errors, status: :unprocessable_entity }
        end
      else
        if (ConfigurationSet.find_by_name(params[:configuration_set][:name]))
          device = Device.find(params[:device_id])
          device.AplicarSet(params[:configuration_set][:name])
          format.html { redirect_to configuration_sets_path, notice: 'Configuration set was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to configuration_sets_path, notice: 'No existe ningun Set de Configracion con el nombre ingresado' }
          format.json { head :no_content }
        end
      end
    end
  end

  # DELETE /configuration_sets/1
  # DELETE /configuration_sets/1.json
  def destroy
    @configuration_set = ConfigurationSet.find(params[:id])
    @configuration_set.destroy

    respond_to do |format|
      format.html { redirect_to configuration_sets_url }
      format.json { head :no_content }
    end
  end
end
