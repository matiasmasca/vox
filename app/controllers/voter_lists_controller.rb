# encoding: utf-8
class VoterListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voter_list
  before_action :set_selection_process
  #before_action :set_category , only: [:index, :show, :edit, :update, :destroy]
  #before_action :check_property, only: [:index, :show, :edit, :update, :destroy]

  #Estado: 1. = "aprobado", 2. = "pendiente", 3. "rechazado"

  def index
    return @voter_list = VoterList.all if current_user.is_admin?

  	#Mostrar el padron del proceso actual.
    return @voter_list = VoterList.includes(:selection_process).where(selection_process_id: user_session[:selection_process_id] ) if @selection_process.is_owner?(current_user.id) && current_user.is_organizer?
  end

  def show
  end

  def new
  	@voter_list = VoterList.new
  end

  def edit
  end

  def create
  	@voter_list = @selection_process.voter_list.create(voter_list_params)
    @voter_list.estado = 2 if @voter_list.estado.nil?
    user_session[:selection_process_id] = @selection_process.id unless @selection_process.nil?

    respond_to do |format|
      if @voter_list.save
        if current_user.is_admin? || @selection_process.is_owner?(current_user.id)
          format.html { redirect_to selection_process_voter_lists_path(@selection_process), notice: 'Usuario agregado al padrón correctamente.' }
        else
          format.html { redirect_to paginas_dashboard_path, notice: 'Solicitud, para ser agregado al padrón, enviada correctamente.' }
        end
      else
        format.html { redirect_to paginas_dashboard_path, alert: 'Elector NO se agrego al padrón.' }
      end
    end
  end

  def update
  end

  def destroy
    @voter_list.destroy
    #raise ''
    respond_to do |format|
      format.html { redirect_to :back, status: 303, notice: 'Elector borrado del padrón correctamente.' }
      #format.html { redirect_to users_url, notice: 'Usuario borrado correctamente.' }
      format.json { head :no_content }
    end
  end

  def add_voter
  	@selection_process = SelectionProcess.find(params[:selection_process_id])
    @voter_list = @selection_process.voter_list.create(voter_list_params)
    redirect_to voter_list_path(@voter_list)
  end

  def admission_voter
    if params[:admission] == "aprobado"
       @voter_list.update!(estado: 1)
    end

    if params[:admission] == "rechazado"
       @voter_list.update!(estado: 3)
    end
    redirect_to :back, notice: "La admisión del elector fue #{params[:admission]} correctamente."
  end

  def enable_voter
  end

  def disable_voter
  end

  def list_voter
  end

  def search_voter
    @user_list = User.search_by_email(params[:search]).order("created_at DESC")

    if @user_list.size == 0
     respond_to do |format|
      format.html { redirect_to :back, status: 303, alert: 'No se encontró Elector con ese correo electrónico.' }
      #format.html { redirect_to users_url, notice: 'Usuario borrado correctamente.' }
      format.json { head :no_content }
      end
    end
  end



 private
 # Never trust parameters from the scary internet, only allow the white list through.
 def voter_list_params
    params.require(:voter_list).permit(:user_id, :selection_process_id, :estado, :search, :admission)
 end

 def set_voter_list
    @voter_list = VoterList.find_by_id(params[:id])
 end

 def set_selection_process
  return if @selection_process
  @selection_process = SelectionProcess.find_by(id: params[:selection_process_id])
 end

 def check_property
    #Si es Admin. puede ver y modificar el padron.
    #Si es un Jurado, no puede ver el padron.
    #Si es Organizador pero no es el dueño, no debe ver el padron.

 end

end


