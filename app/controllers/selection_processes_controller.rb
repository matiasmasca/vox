class SelectionProcessesController < ApplicationController
  before_action :set_selection_process, only: [:show, :edit, :update, :destroy]

  # GET /selection_process
  # GET /selection_process.json
  def index
    @selection_processes = SelectionProcess.all
  end

  # GET /selection_process/1
  # GET /selection_process/1.json
  def show
  end

  # GET /selection_process/new
  def new
    @selection_process = SelectionProcess.new
    
  end

  # GET /selection_process/1/edit
  def edit
  end

  # POST /selection_process
  # POST /selection_process.json
  def create
    @selection_process = SelectionProcess.new(selection_process_params)

    respond_to do |format|
      if @selection_process.save
        format.html { redirect_to @selection_process, notice: 'Premio creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @selection_process }
      else
        format.html { render action: 'new' }
        format.json { render json: @selection_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selection_process/1
  # PATCH/PUT /selection_process/1.json
  def update
    respond_to do |format|
      if @selection_process.update(selection_process_params)
        format.html { redirect_to @selection_process, notice: 'Proceso actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @selection_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_process/1
  # DELETE /selection_process/1.json
  def destroy
    @selection_process.destroy
    respond_to do |format|
      format.html { redirect_to selection_processes_url, notice: 'Proceso borrado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection_process
      @selection_process = SelectionProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_process_params
      params.require(:selection_process).permit(:name_process, :place, :duration, :start_date, :end_date, :process_type_id, :state, :organizer_id)
    end
end
