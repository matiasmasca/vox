# encoding: utf-8
class OrganizersController < ApplicationController
  before_action :set_organizer, only: [:show, :edit, :update, :destroy]
  # GET /organizers
  # GET /organizers.json
  def index
    @organizers = Organizer.all
  end

  # GET /selection_process/1
  # GET /selection_process/1.json
  def show
  end
  
  # GET /organizers/new
  def new
    @organizer = Organizer.new
  end

  # POST /organizer
  # POST /organizer.json
  def create
    @organizer = Organizer.new(organizer_params)

    respond_to do |format|
      if @organizer.save
        format.html { redirect_to @organizer, notice: 'Organización dada de alta correctamente.' }
        format.json { render action: 'show', status: :created, location: @organizer }
      else
        format.html { render action: 'new' }
        format.json { render json: @organizer.errors, status: :unprocessable_entity }
      end
    end
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizer_params
      params.require(:organizer).permit(:name, :address, :web, :email)
    end

end
