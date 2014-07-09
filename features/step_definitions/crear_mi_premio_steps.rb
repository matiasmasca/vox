# encoding: utf-8
Dado(/^completo los datos del premio$/) do
  steps %{
	  Y escribo "Premios ACME" en Nombre
 	  Y escribo "Av. Siempre Viva 742" en Lugar,
 	  Y escribo "30" en Duracion
  	  Y selecciono "2014/08/13" en Fecha Inicio
  	  Y selecciono "2014/09/2" en Fecha Cierre
  	  Y en Tipo de Proceso selecciono "premio"
  	}
end

Entonces(/^el premio pertenece a la organización del usuario$/) do
  puts(@user.inspect) 
  puts(@organizer.inspect)
end
