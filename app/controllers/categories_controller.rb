# encoding: utf-8
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_selection_process
  before_action :check_property, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    #Filtro: solo veo mis procesos.
    if !params[:selection_process_id].blank? #|| ADMIN
      @categories = Category.where(selection_process_id: @selection_process.id)
    else
      @categories = Category.all
    end     
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    if !params[:selection_process_id].blank? #|| ADMIN
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
    @category.destroy
    respond_to do |format|
      format.html do
        redirect_to(selection_process_category_path(@selection_process), notice: 'Categoría borrada correctamente.') if !params[:selection_process_id].nil?
        redirect_to(categories_url, notice: 'Categoría borrada correctamente, por el Admin.') if params[:selection_process_id].nil?
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by_id(params[:id])
      respond_to do |format|
        format.html do
          if @category.nil?
             redirect_to(root_path, alert: "No se encontró proceso de selección con ese ID.")
          end
        end
      end
    end

    def set_selection_process
      if !params[:selection_process_id].blank? #|| ADMIN
         @selection_process = SelectionProcess.find_by_id(params[:selection_process_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :bench, :selection_process_id)
    end

    #Filtro de Propiedad.
    # Un usuario solo puede modificar operar con las Organizaciones que haya creado.
    def check_property
      if !params[:selection_process_id].blank? #|| ADMIN
      @selection_process = SelectionProcess.find_by_id(params[:selection_process_id])
      respond_to do |format|
        format.html do
          unless @selection_process == @category.selection_process
             redirect_to(user_organizer_path(@selection_process.organizer.user,@selection_process.organizer), alert: "Solo puedes operar sobre las categorías del proceso seleccionado.")
          end
        end
        end
      end
    end   
end
