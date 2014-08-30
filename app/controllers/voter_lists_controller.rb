# encoding: utf-8
class VoterListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_voter_list
  #before_action :set_selection_process
  #before_action :set_category , only: [:index, :show, :edit, :update, :destroy]
  #before_action :check_property, only: [:index, :show, :edit, :update, :destroy]

  def index
  	@voter_list = VoterList.all
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
        format.html { redirect_to selection_process_voter_lists_path(@selection_process), notice: 'Usuario agregado al padrón correctamente.' }
      else
        format.html { render action: 'new' }
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

  def enable_voter
  end

  def disable_voter
  end

  def list_voter
  end

  def search_voter
  end



 private
 # Never trust parameters from the scary internet, only allow the white list through.
 def voter_list_params
    params.require(:voter_list).permit(:user_id, :selection_process_id, :estado)
 end

 def set_voter_list
    @voter_list = VoterList.find_by_id(params[:id])
 end

end


