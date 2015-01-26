# encoding: utf-8
# Registra en que categorias ya voto el usuario.
class EmittedVotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_emitted_vote , only: [ :show ]
  before_action :check_property , only: [ :show , :index ]

  # GET /emitted_votes
  # GET /emitted_votes.json
  def index
    @emitted_votes = EmittedVote.all
  end

  # GET /emitted_votes/1
  # GET /emitted_votes/1.json
  def show
  end

  # GET /emitted_votes/new
  def new
    @emitted_vote = EmittedVote.new
  end

  # POST /emitted_votes
  # POST /emitted_votes.json
  def create
    @emitted_vote = EmittedVote.new(emitted_vote_params)

    respond_to do |format|
      if @emitted_vote.save
        format.html { redirect_to @emitted_vote , notice: 'Emitted vote was successfully created.' }
        format.json { render 'show' , status: :created , location: @emitted_vote }
      else
        format.json { render json: @emitted_vote.errors , status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emitted_vote
      @emitted_vote = EmittedVote.find( params[ :id ] )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emitted_vote_params
      params.require(:emitted_vote).permit( :user_id , :category_id , :candidate_id )
    end

    def check_property
      return true if @current_user.is_admin?
      security_exit
    end

    def security_exit
        respond_to do |format|
        format.html do
           user_session[:selection_process_id] = nil
           user_session[:category_id] = nil
           redirect_to(:back, alert: 'Solo puedes operar sobre las categorías del proceso seleccionado.')
           return false
        end
      end
    end
end