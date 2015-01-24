# encoding: utf-8
class BallotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ballot , only: [ :show]
  before_action :check_property , only: [ :show , :index ]

  # GET /ballots
  # GET /ballots.json
  def index
    @ballots = Ballot.all
  end

  # GET /ballots/1
  # GET /ballots/1.json
  def show
  end

  # GET /ballots/new
  def new
    @ballot = Ballot.new
  end

  # POST /ballots
  # POST /ballots.json
  def create
    @ballot = Ballot.new(ballot_params)
    category_id = params[category_id].to_i
    # Registra que voto en esa categoria, pero no se sabrá a quien voto.
    @emitted_vote = EmittedVote.create!(user_id: current_user.id , category_id: @ballot.category_id)

    respond_to do |format|
      if @ballot.save
        format.html { redirect_to :back , notice: 'Voto registrado correctamente.' }
        format.json { render action: 'show' , status: :created , location: @ballot }
      else
        format.json { render json: @ballot.errors , status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballot
      @ballot = Ballot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ballot_params
      params.require(:ballot).permit( :selection_process_id , :category_id , :candidate_id , :digital_signature )
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