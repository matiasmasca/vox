# encoding: utf-8
# Ojo con los before y after action que se ejecutaran en cada acción, en cada llamada a los metodos.
class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate , only: [ :show , :edit , :update , :destroy ]
  before_action :set_category
  before_action :check_property , except: [ :show ] #,  only: [:index, :edit, :update, :destroy]

  # GET /candidates
  # GET /candidates.json
  def index
    # Filtro: solo veo mis candidatos.
    if !params[:category_id].blank? # || ADMIN
      @candidates = Candidate.where(category_id: @category)
    else
      return @candidates = Candidate.all if current_user.is_admin?
    end

    if !params[:selection_process_id].blank?
      # <!--Candidatos where: category.selection_process_id == selection_process -->
      @categories = Category.where(selection_process_id: params[:selection_process_id])
      @candidates = Candidate.where(category_id: @categories)
    end

    unless user_session[:selection_process_id].nil?
      @categories = Category.where(selection_process_id: user_session[:selection_process_id])
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
    user_session[:category_id] = @candidate.category_id
    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate , notice: 'Candidato creado correctamente.' }
        format.json { render action: 'show', status: :created , location: @candidate }
      else
        format.html { render action: 'new' }
        format.json { render json: @candidate.errors , status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate , notice: 'Información actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @candidate.errors , status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to :back , status: 303 , notice: 'Candidato borrado correctamente.' }
      # if !params[:category_id].nil?
          #format.html {  redirect_to(category_candidates_path(@category), notice: 'Categoría borrada correctamente.')
       # else
          #format.html { redirect_to candidates_url, notice: 'Candidato borrado correctamente.' }
      # end
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      candidate_id = user_session[:candidate_id] unless user_session[:candidate_id].nil?
      candidate_id = params[:id] unless params[:id].blank?
      if candidate_id
        @candidate = Candidate.find_by_id(candidate_id)
      end
    end

    def set_category
      category_id = user_session[:category_id] unless user_session[:category_id].nil?
      category_id = params[:category_id] unless params[:category_id].nil?
      category_id = @candidate.category_id if @candidate

    if category_id
      @category = Category.find_by_id(category_id)
      user_session[:category_id] = @category.id if @category
      unless @category.selection_process.nil?
        @selection_process = @category.selection_process
        @organizer = @selection_process.organizer
        # @user = User.find_by_id(@selection_process.organizer.user_id)
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit( :name , :bios , :url_image , :category_id , :selection_process_id , :avatar_file )
    end

    # Filtro de Propiedad.
    # Un usuario solo puede modificar operar con las Organizaciones que haya creado.
    def check_property
      return true if @current_user.is_admin?

      # Cambiar parametro arriba.
      if !params[:category_id].blank? && @candidate # || ADMIN
      # @user = User.find_by_id(params[:category_id])
      # logger.debug 'CANDIDATE: #{@candidate} '
      respond_to do |format|
        format.html do
          unless @candidate.category_id == @category.id
            user_session[:category_id] = nil
            redirect_to(edit_user_organizer_path(@category.selection_process.organizer.user,@category.selection_process.organizer), alert: 'Solo puedes operar sobre el proceso que tu hayas creado.')
          end
        end
        end
      end

      # Primero si puede ver el proceso.
      set_selection_process if @selection_process.nil?
      unless @selection_process.is_owner?(current_user.id)
        security_exit
        return false
      end

      @organizer = @organizer.selection_process.find_by_id(@selection_process)

      if @selection_process.organizer != @current_user.organizer && !@current_user.is_admin?
        respond_to do |format|
          format.html do
            unless @selection_process == @category.selection_process
               user_session[:selection_process_id] = nil
               user_session[:category_id] = nil
               redirect_to(:back , alert: 'Solo puedes operar sobre las categorías del proceso seleccionado.')
            end
          end
        end
      end
    end

     def security_exit
        respond_to do |format|
        format.html do
           user_session[:selection_process_id] = nil
           user_session[:category_id] = nil
           redirect_to(:back , alert: 'Solo puedes operar sobre las categorías del proceso seleccionado.')
           return false
        end
      end
    end
end