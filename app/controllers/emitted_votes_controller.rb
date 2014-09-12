# Registra en que categorias ya voto el usuario.

class EmittedVotesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_emitted_vote, only: [:show, :edit, :update, :destroy]

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

  # GET /emitted_votes/1/edit
  def edit
  end

  # POST /emitted_votes
  # POST /emitted_votes.json
  def create
    @emitted_vote = EmittedVote.new(emitted_vote_params)

    respond_to do |format|
      if @emitted_vote.save
        format.html { redirect_to @emitted_vote, notice: 'Emitted vote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @emitted_vote }
      else
        format.html { render action: 'new' }
        format.json { render json: @emitted_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emitted_votes/1
  # PATCH/PUT /emitted_votes/1.json
  def update
    respond_to do |format|
      if @emitted_vote.update(emitted_vote_params)
        format.html { redirect_to @emitted_vote, notice: 'Emitted vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @emitted_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emitted_votes/1
  # DELETE /emitted_votes/1.json
  def destroy
    @emitted_vote.destroy
    respond_to do |format|
      format.html { redirect_to emitted_votes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emitted_vote
      @emitted_vote = EmittedVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emitted_vote_params
      params.require(:emitted_vote).permit(:user_id, :category_id, :candidate_id)
    end
end
