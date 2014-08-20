# encoding: utf-8
# Ojo con los before y after action que se ejecutaran en cada acción, en cada llamada a los metodos.
class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  before_action :set_category
  before_action :check_property,  only: [:show, :edit, :update, :destroy]

  # GET /candidates
  # GET /candidates.json
  def index
    #Filtro: solo veo mis candidatos.
    if !params[:category_id].blank? #|| ADMIN
      @candidates = Candidate.where(category_id: @category)
    else
      @candidates = Candidate.all
    end
    
    if !params[:selection_process_id].blank?
      #<!--Candidatos where: category.selection_process_id == selection_process -->
      @categories = Category.where(selection_process_id: params[:selection_process_id])
      @candidates = Candidate.where(category_id: @categories)
    end

  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: 'Candidato creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @candidate }
      else
        format.html { render action: 'new' }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: 'Información actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to :back, status: 303, notice: 'Candidato borrado correctamente.' }
      #if !params[:category_id].nil? 
          #format.html {  redirect_to(category_candidates_path(@category), notice: 'Categoría borrada correctamente.')          
       # else
          #format.html { redirect_to candidates_url, notice: 'Candidato borrado correctamente.' }
      #end
      format.json { head :no_content }
       
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find_by_id(params[:id])
    end

    def set_category
    if params[:category_id]
      @category = Category.find_by_id(params[:category_id]) 
      unless @category.selection_process.nil?
        @selection_process = @category.selection_process
        @organizer = @selection_process.organizer
        #@user = User.find_by_id(@selection_process.organizer.user_id)
      end
      #flash.notice = "Pase por set_category"
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:name, :bios, :url_image, :category_id, :selection_process_id, :avatar_file)
    end

    # Filtro de Propiedad.
    # Un usuario solo puede modificar operar con las Organizaciones que haya creado.
    def check_property
      if !params[:category_id].blank? #|| ADMIN
      #@user = User.find_by_id(params[:category_id])
      #logger.debug "CANDIDATE: #{@candidate} " 
      respond_to do |format|
        format.html do
          unless @candidate.category_id == @category.id
            redirect_to(edit_user_organizer_path(@category.selection_process.organizer.user,@category.selection_process.organizer), alert: "Solo puedes operar sobre la organización que tu hayas creado.")
          end
        end
        end
      end
    end   

end
