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
  #puts(@user.inspect) 
  #puts(@organizer.inspect)
  #puts("Proceso:" + @selection_process.inspect)
  @selection_process.should belong_to(:organizer)
  @selection_process.organizer_id.should eq(@user.organizer.id)
end

Dado(/^completo los datos del proceso con "(.*?)", "(.*?)", "(.*?)"$/) do |name, place, duration|
  
   if name
    fill_in "selection_process_name_process", :with => name
  end

  if place
    fill_in "selection_process_place", :with => place
  end

  if duration
    fill_in "selection_process_duration", :with => duration
  end

  select_date("2014/08/13", :from => "Fecha de inicio")
  select_date("2014/09/21", :from => "Fecha cierre")
  select "premio", :from => "Tipo"
  #save_and_open_page
end

