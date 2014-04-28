# encoding: utf-8
class OrganizersController < ApplicationController
  before_action :set_organizer, only: [:show, :edit, :update, :destroy]
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
        format.html { redirect_to @organizer, notice: 'Proceso actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  #def upload
   #unless params[:organizer][:logo].blank?   
    #uploaded_io = params[:organizer][:logo]
    #Dir.mkdir '/uploads/isologos' unless File.directory? '/uploads/isologos'
    #File.open(Rails.root.join('public', 'uploads', 'isologos', uploaded_io.original_filename), 'wb') do |file|
    #  file.write(uploaded_io.read)
    #end
    #@organizer.logo = (uploaded_io.original_filename).split('.').last.downcase
   #end

  # DELETE /organizers/1
  # DELETE /organizers/1.json
  def destroy
    @organizer.destroy
    respond_to do |format|
      format.html { redirect_to organizers_url, notice: 'Organización borrada correctamente.' }
      format.json { head :no_content }
    end
  end


 private
    # Para evitar repetir este código en cada acción.
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizer_params
      params.require(:organizer).permit(:name, :address, :web, :email, :image)
    end

end
