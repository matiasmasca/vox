# encoding: utf-8
class PaginasController < ApplicationController
  before_action :authenticate_user! , except: [ :home , :about , :contact ]
  before_action :set_user
  before_action :set_selection_process , only: [ :user_dashboard ]

  def home
    @selection_processes = SelectionProcess.all
  end

  def about
  end

  def contact
  end

  def user_dashboard
    # va a buscar un template llamado /user_dashboard.html.erb
    # Podemos usar esto para simular el usuario, mientras no tengamos el login.
    # crear esas variables de @intancia que necesitamos en la vista.
    # ir al dashboard del organizador.
      #logger.debug 'Person attributes hash: #{@user.attributes.inspect}'
      #logger.debug 'Person attributes hash: #{@user.inspect}'
      #if user_signed_in?
        #logger.debug 'Current User hash: #{current_user.inspect}'
        #logger.debug 'User session hash: #{user_session.inspect}'
        #@user = current_user
      #end

      #Aca podrias redirigir para otro lado si no hay usuario con ese ID, y cosas asi
  end

  def admin_dashboard
    @selection_processes = nil
    @organizador = nil
    set_user
  end

  def jury_dashboard
    set_user
    @selection_process = nil
    user_session[:selection_process_id] = 0
    @selection_processes =  SelectionProcess.includes(:voter_list).where("voter_lists.user_id = #{current_user.id}")
    # ir al dashboard del jurado.
  end

  def user_dashboard
    set_user
  end

  def dashboard
    set_user
    @selection_processes = SelectionProcess.all
    # aca mostraría los que puede participar
    @selection_processes = SelectionProcess.includes(:voter_list).where(:state => 'nuevo') if current_user.is_jury? || current_user.is_admin?
  end

  def votante
    # ir al dashboard del elector.
  end

  # Para pruebas de stress
  def loaderio
    # render :text => ENV['loaderio'].to_s if Rails.env.production?
    render html: ENV['loaderio'].to_s if Rails.env.production?
  end

  def stats
    # Procesos por tipo
    @procesos_por_tipo = {}
    @procesos_por_tipo[:premio] = SelectionProcess.where(process_type_id: '1').count
    @procesos_por_tipo[:certamen] = SelectionProcess.where(process_type_id: '2').count
    @procesos_por_tipo[:votación] = SelectionProcess.where(process_type_id: '3').count

    # Cantidad por Tipo de usuario.
    @usuarios_por_tipo = {}
    @usuarios_por_tipo[:Administrador] = User.where(tipo_usuario_id: '1').count
    @usuarios_por_tipo[:Jurado] = User.where(tipo_usuario_id: '2').count
    @usuarios_por_tipo[:Organizador] = User.where(tipo_usuario_id: '3').count
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # en desuso por Devise
    def set_user
      if user_signed_in?
        @current_user = current_user
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:paginas).permit( :id , :organizer_id , :selection_process_id , :category_id )
    end
end