# encoding: utf-8
class OrganizersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organizer, only: [:show, :edit, :update, :destroy]
  before_action :check_property, only: [:show, :edit, :update, :destroy]


  # GET /organizers
  # GET /organizers.json
  def index
    @organizers = Organizer.all
  end

  # GET /organizers/1
  # GET /organizers/1.json
  def show
  end
  
  # GET /organizers/new
  def new
    @organizer = Organizer.new
  end

  # GET /organizers/1/edit
  # GET /users/1/organizer/1/edit
  def edit      
  end

  # POST /organizer
  # POST /organizer.json
  def create
    @organizer = Organizer.new(organizer_params)

    respond_to do |format|
      if @organizer.save
        format.html { redirect_to @organizer, notice: 'Organización dada de alta correctamente.' }
        format.json { render action: 'show', status: :created, location: @organizer }
      else
        format.html { render action: 'new' }
        format.json { render json: @organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selection_process/1
  # PATCH/PUT /selection_process/1.json
  def update
    respond_to do |format|
      if @organizer.update(organizer_params)
        format.html { redirect_to @organizer, notice: 'Organización actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizers/1
  # DELETE /organizers/1.json
  def destroy
    @organizer.destroy
    respond_to do |format|
      format.html { redirect_to :back, status: 303, notice: 'Organización borrada correctamente.' }
      #format.html { redirect_to organizers_url, notice: 'Organización borrada correctamente.' }
      format.json { head :no_content }
    end
  end


 private
    # Para evitar repetir este código en cada acción.
    def set_organizer
      @organizer = Organizer.find_by_id(params[:id])
      @user = @organizer.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizer_params
      params.require(:organizer).permit(:name, :address, :web, :email, :image, :user, :user_id)
    end

    #Filtro de Propiedad.
    # Un usuario solo puede modificar operar con las Organizaciones que haya creado.
    def check_property
      if !params[:user_id].blank? #|| ADMIN
      @user = User.find_by_id(params[:user_id])
      respond_to do |format|
        format.html do
          unless @user.organizer == @organizer
            redirect_to(edit_user_organizer_path(@user,@user.organizer), alert: "Solo puedes operar sobre la organización que tu hayas creado.")
          end
        end
      end
    end   
    end

end
