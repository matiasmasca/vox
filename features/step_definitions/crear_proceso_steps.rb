# encoding: utf-8

Dado(/^escribo "(.*?)" en Nombre$/) do |nombre|
	fill_in "selection_process_name_process", :with => nombre
end

Dado(/^escribo "(.*?)" en Lugar,$/) do |lugar|
  fill_in "selection_process_place", :with => lugar
end

Dado(/^escribo "(.*?)" en Duracion$/) do |duration|
  fill_in "selection_process_duration", :with => duration
end

Dado(/^selecciono "(.*?)" en Fecha Inicio$/) do |start_date|
  select_date(start_date, :from => "Fecha de inicio")
end

Dado(/^selecciono "(.*?)" en Fecha Cierre$/) do |end_date|
  select_date(end_date, :from => "Fecha cierre")
end

Dado(/^en Tipo de Proceso selecciono "(.*?)"$/) do |tipo|
 select tipo, :from => "Tipo"
end

Entonces(/^se crea el premio y me muestra el mensaje "(.*?)"$/) do |msg|
  #Elemento: notice
  page.should have_content(msg)
  @selection_process = SelectionProcess.last
end

#Casos extremos
Dado(/^dejo en blanco Nombre$/) do
  fill_in "Nombre del proceso", :with => nil
end

Dado(/^dejo en blanco Lugar$/) do
  fill_in "Lugar", :with => nil
end

Cuando(/^como ya existe un premio con ese nombre "(.*?)" y lugar "(.*?)"$/) do |nombre, lugar|
  @selection_process = SelectionProcess.create!({ :name_process => nombre, :place => lugar })
end

#Podrias probar más fino cada error comprobando que sea el error que buscas.