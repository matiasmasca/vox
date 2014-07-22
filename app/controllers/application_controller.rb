# encoding: utf-8
#Nota mental: todos los controller heredan de aca.
# Ojo con los before y after action que se ejecutaran en cada acción de las subclases.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_filter :load_sidebar

  #def load_sidebar
  	#Aca tendrías que poner todo lo que necesitas pre-cargar en la barra lateral.
  	#Ojo que se ejecuta en cada llamado...
  #end
end
