# encoding: utf-8
class PaginasController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about, :contact]
  before_action :set_user
  before_action :set_selection_process , only: [:user_dashboard]
  

  def home
  end

  def about
  end

  def contact
  end

  def dashboard    
  end

  def user_dashboard
  	# va a buscar un template llamado /user_dashboard.html.erb
  	# Podemos usar esto para simular el usuario, mientras no tengamos el login.
  	# crear esas variables de @intancia que necesitamos en la vista.
  	# ir al dashboard del organizador.
      #logger.debug "Person attributes hash: #{@user.attributes.inspect}"
      #logger.debug "Person attributes hash: #{@user.inspect}"
      #if user_signed_in?
        #logger.debug "Current User hash: #{current_user.inspect}"
        #logger.debug "User session hash: #{user_session.inspect}"
        #@user = current_user  
      #end
      
      #Aca podrias redirigir para otro lado si no hay usuario con ese ID, y cosas asi
            
  end

  def admin_dashboard
    set_user
  end

  def jurado
  	# ir al dashboard del jurado.
  end

  def votante
  	# ir al dashboard del elector.
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    #en desuso por Devise
    def set_user
      if user_signed_in?
        @current_user = current_user  
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:paginas).permit(:id, :organizer_id, :selection_process_id, :category_id)
    end
end
