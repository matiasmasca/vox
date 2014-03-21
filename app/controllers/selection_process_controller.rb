class SelectionProcessController < ApplicationController
  before_action :set_selection_processes, only: [:show, :edit, :update, :destroy]

  # GET /selection_process
  # GET /selection_process.json
  def index
    @selection_process = SelectionProcesses.all
  end

  # GET /selection_process/1
  # GET /selection_process/1.json
  def show
  end

  # GET /selection_process/new
  def new
    @selection_processes = SelectionProcesses.new
  end

  # GET /selection_process/1/edit
  def edit
  end

  # POST /selection_process
  # POST /selection_process.json
  def create
    @selection_processes = SelectionProcesses.new(selection_processes_params)

    respond_to do |format|
      if @selection_processes.save
        format.html { redirect_to @selection_processes, notice: 'Premio creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @selection_processes }
      else
        format.html { render action: 'new' }
        format.json { render json: @selection_processes.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selection_process/1
  # PATCH/PUT /selection_process/1.json
  def update
    respond_to do |format|
      if @selection_processes.update(selection_processes_params)
        format.html { redirect_to @selection_processes, notice: 'Selection processes was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @selection_processes.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_process/1
  # DELETE /selection_process/1.json
  def destroy
    @selection_processes.destroy
    respond_to do |format|
      format.html { redirect_to selection_process_url, notice: 'Proceso borrado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection_processes
      @selection_processes = SelectionProcesses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_processes_params
      params.require(:selection_processes).permit(:name_process, :place, :duration, :start_date, :end_date, :process_type_id, :state)
    end
end
