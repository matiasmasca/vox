# encoding: utf-8
class PaginasController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def organizador
  	# va a buscar un template llamado /organizador.html.erb
  	# Podemos usar esto para simular el usuario, mientras no tengamos el login.
  	# crear esas variables de @intancia que necesitamos en la vista.
  	# ir al dashboard del organizador.
  end

  def jurado
  	# ir al dashboard del jurado.
  end

  def votante
  	# ir al dashboard del elector.
  end
end
