# encoding: utf-8
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_selection_process
  before_action :set_category, except: [:new] #, only: [:index, :show, :edit, :update, :destroy]
  before_action :check_property, except: [:show] #, only: [:index, :show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    #Filtro: solo veo mis procesos.
    if !params[:selection_process_id].blank? && !current_user.is_admin?
      @categories = Category.where(selection_process_id: @selection_process.id)
    else
      @categories = Category.all if current_user.is_admin?
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    if !params[:selection_process_id].blank? #|| ADMIN
      #TO-DO: esto esta demas por el filtro set_selection_process
       @selection_process = SelectionProcess.find_by_id(params[:selection_process_id])
    end
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    user_session[:category_id] = @category.id
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Categoría creada correctamente.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Información actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    user_session[:category_id] = nil
    @category.destroy
    respond_to do |format|
        format.html { redirect_to :back, status: 303, notice: 'Categoría borrada correctamente.' }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      category_id = user_session[:category_id] unless user_session[:category_id].nil?
      category_id = params[:id] unless params[:id].nil?
        if current_user.is_admin?
          @categories = Category.all
        else
          @categories = Category.where(selection_process_id: @selection_process.id)
        end

      if category_id
        @category = Category.find_by_id(category_id)
        user_session[:category_id] = @category.id unless @category.nil?
        respond_to do |format|
          format.html do
            if @category.nil?
               redirect_to(root_path, alert: "No se encontró una categoria con ese ID.")
            end
          end
        end
      else
        @category = nil
      end
    end

    def set_selection_process
      #return @selection_process if @selection_process
      selection_process_id = user_session[:selection_process_id] unless user_session[:selection_process_id].nil?
      selection_process_id = params[:selection_process_id] unless params[:selection_process_id].nil?

      if selection_process_id
         @selection_process = SelectionProcess.find_by_id(selection_process_id)
         @organizer = @selection_process.organizer unless @selection_process.nil?
         user_session[:selection_process_id] = @selection_process.id unless @selection_process.nil?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :bench, :selection_process_id)
    end

    #Filtro de Propiedad.
    # Un usuario solo puede modificar operar con las categorias de un proceso seleccionado o a lo sumo de uno que él haya creado.
    def check_property
      return true if @current_user.is_admin?

      #Primero si puede ver el proceso.
      set_selection_process if @selection_process.nil?
      unless @selection_process.is_owner?(current_user.id)
        security_exit
        return false
      end

      @organizer = @organizer.selection_process.find_by_id(@selection_process)

      #Luego si la categoria es del proceso seleccionado.
      if !params[:organizer_id].blank?
        @organizer = Organizer.find_by_id(params[:organizer_id])
      else
        @organizer = @current_user.organizer unless @current_user.is_admin?
        params[:organizer_id] = @organizer.id
      end

        #puts("ACAAAAAAAAAAAAA!!!!!!!!!!! <<<<<=======")
        #puts("@selection_process = #{@selection_process}")
        #puts("@category.selection_process = #{@category.selection_process}")

      if @selection_process.organizer != @current_user.organizer && !@current_user.is_admin?
        respond_to do |format|
          format.html do
            unless @selection_process == @category.selection_process
               user_session[:selection_process_id] = nil
               user_session[:category_id] = nil
               redirect_to(organizer_selection_process_path(@selection_process.organizer.user, @selection_process), alert: "Solo puedes operar sobre las categorías del proceso seleccionado.")
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
           redirect_to(root_path, alert: "Solo puedes operar sobre las categorías del proceso seleccionado.")
           return false
        end
      end
    end
end
