# encoding: utf-8
class PaginasController < ApplicationController
  before_action :set_user, only: [:user_dashboard]
  before_action :set_selection_process , only: [:user_dashboard]

  def home
  end

  def about
  end

  def contact
  end

  def user_dashboard
  	# va a buscar un template llamado /organizador.html.erb
  	# Podemos usar esto para simular el usuario, mientras no tengamos el login.
  	# crear esas variables de @intancia que necesitamos en la vista.
  	# ir al dashboard del organizador.
      #logger.debug "Person attributes hash: #{@user.attributes.inspect}"
      
      #Aca podrias redirigir para otro lado si no hay usuario con ese ID, y cosas asi
            
  end

  def jurado
  	# ir al dashboard del jurado.
  end

  def votante
  	# ir al dashboard del elector.
  end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_id(params[:id])
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:paginas).permit(:id, :organizer_id, :selection_process_id, :category_id)
    end
end
