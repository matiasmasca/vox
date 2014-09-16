# encoding: utf-8
#Nota mental: todos los controller heredan de aca.
# Ojo con los before y after action que se ejecutaran en cada acción de las subclases.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   
  #Parametros para formularios de Devise.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_action :set_user
  before_filter :load_sidebar

 private
  def load_sidebar
  	#Aca tendrías que poner todo lo que necesitas pre-cargar en la barra lateral.
  	#Ojo que se ejecuta en cada llamado...
  	set_selection_process  if user_signed_in?
  end

  def set_selection_process
      selection_process_id = user_session[:selection_process_id] unless user_session[:selection_process_id].nil?
      selection_process_id = params[:selection_process_id] unless params[:selection_process_id].nil?
      
      if params[:selection_process_id] || user_session[:selection_process_id]
        @selection_process = SelectionProcess.find_by_id(selection_process_id)
        if @selection_process && @selection_process.is_owner?(current_user.id) && !current_user.is_admin? 
          user_session[:selection_processes_id] = @selection_process.id if @selection_process
        else
          @selection_process = nil
          user_session[:selection_processes_id] = nil
        end
      end
      
      #Set_organizer
      if !@selection_process.nil?
        @organizer = @selection_process.organizer
        user_session[:organizer_id] = @organizer.id if @organizer    
      end
  end


  def set_user
      if user_signed_in?
      @current_user ||= current_user && User.find_by(id: current_user.id)

        if current_user.tipo_usuario_id == 3 && current_user.organizer
          user_session[:organizer_id] = current_user.organizer.id 
        end
        #logger.info(user_session[:organizer_id])
      else
        current_user = User.new
      end
  end

  def security_exit
        respond_to do |format|
        format.html do
           redirect_to(root_path, alert: "Operación no permitida.")
           #return false
        end
      end
    end

  protected

  # A donde va cuando inicia la sesión.
  def after_sign_in_path_for(resource)
    # return the path based on resource
    case current_user.tipo_usuario_id
    when 1
      path = "/paginas/admin_dashboard/#{current_user.id}" 
    when 2
      path = "/paginas/jury_dashboard/#{current_user.id}" 
    when 3
      path = "/paginas/user_dashboard/#{current_user.id}" 
      #redirect(path)
      #redirect paginas_user_dashboard_path(@current_user)
    else
      request.referrer       
    end
    #Redirecciona a este path...
    path 
  end

  # A donde va cuando finaliza la sesión.
  def after_sign_out_path_for(resource_or_scope)
    #request.referrer
    "/"
  end

  #Parametros para formularios de Devise.
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:usuario, :nombre, :apellido, :email, :facebook, :twitter, :tipo_usuario_id, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:usuario, :nombre, :apellido, :email, :facebook, :twitter, :tipo_usuario_id, :password, :password_confirmation, :current_password)
    end
  end



end
