class UserInformationsController < ApplicationController
  before_filter :authenticate_user!
  # GET /permissions
  # GET /permissions.json
  def index
    @enterprises = Enterprise.includes(:users).all  
    respond_to do |format| 
      format.html # index.html.erb
      format.json { render json: @enterprises}
    end
  end

  # GET /permissions/1
  # GET /permissions/1.json 
  def show
    @enterprise = Enterprise.includes(:users).find(params[:id])
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /permissions/new
  # GET /permissions/new.json
  def new
    @usuario = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /permissions/1/edit
  def edit
    @usuario = User.find(params[:id])
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @usuario = User.new(params[:user])
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to user_informations_path, notice: 'User was successfully created.' }
        format.json { render json: @usuario, status: :created, location: @usuario}
      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /permissions/1
  # PUT /permissions/1.json
  def update 
    @usuario = User.find(params[:id])
    respond_to do |format|
      if @usuario.update_attributes(params[:user])
        format.html { redirect_to user_informations_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @usuario = User.find(params[:id])
    @usuario.destroy 

    respond_to do |format| 
      format.html { redirect_to user_informations_path }
      format.json { head :no_content }
    end
  end
end
