# encoding: utf-8
#Nota mental: todos los controller heredan de aca.
# Ojo con los before y after action que se ejecutaran en cada acción de las subclases.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_sidebar

  before_action :set_user

  #Parametros para formularios de Devise.
  before_filter :configure_permitted_parameters, if: :devise_controller?

 private
  def load_sidebar
  	#Aca tendrías que poner todo lo que necesitas pre-cargar en la barra lateral.
  	#Ojo que se ejecuta en cada llamado...
  	set_selection_process if params[:selection_process_id]
  end

  def set_selection_process
      @selection_process = SelectionProcess.find_by_id(params[:selection_process_id])
      if !@selection_process.nil? && @user.nil?
        @organizer = @selection_process.organizer
        #@user = User.find_by_id(@selection_process.organizer.user_id)
      end
      #flash.notice = "Pase por set_selection_process"
  end

  def set_user
      if user_signed_in?
        @current_user = current_user  
      end
  end

  protected

  # A donde va cuando inicia la sesión.
  def after_sign_in_path_for(resource)
    # return the path based on resource
    case @user.tipo_usuario_id
    when 1
      path = "/paginas/admin_dashboard/#{@user.id}" 
    when 2
      path = "/paginas/jury_dashboard/#{@user.id}" 
    when 3
      path = "/paginas/user_dashboard/#{@user.id}" 
      #redirect(path)
      #redirect paginas_user_dashboard_path(@user)
    else
      request.referrer       
    end

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
