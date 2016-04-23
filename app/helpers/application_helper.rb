# encoding: utf-8
module ApplicationHelper
# Mensajes de Error con Bootstrap
  def bootstrap_class_for flash_type
    { success: 'alert-success' , error: 'alert-error' , alert: 'alert-warning' , notice: 'alert-info' } [flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
                concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
                concat message
            end 
            )
    end
    nil
  end
# Boostrap: Poner  <%= flash_messages %> en el layout.

# Tabla sin registros:
  # Muestra un mensaje se que aun no hay registros cargados en una tabla.
  # @to-do: es recomendable refactorizar este helper y llevarlo a un un metodo de instancia para un Controller. El helper se usa para formatear la vista.
  def tabla_sin_registros(modelo)
    unless modelo.first
       # flash[:notice] = 'Ud. no tiene registros creados.\n \n Cuando los haya creado se listaran aqui.'
       # A la vista tenes que mandar por content_tag (ActionView::Helpers::TagHelper)
       @content = content_tag(:tr, content_tag(:td, 'Ud. no tiene registros creados.'))
       @content << content_tag(:tr, content_tag(:td, 'Cuando los haya creado se listaran aqui.'))
    end
  end
end