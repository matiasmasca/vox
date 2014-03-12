# encoding: utf-8
Dado(/^que estoy en la pantalla de mis procesos electorales y hago click en "Nuevo proceso de selección"$/) do
  visit("/selection_process")
  click_on "Nuevo proceso de selección"
end

Dado(/^escribo "(.*?)" en Nombre$/) do |nombre|
	fill_in "selection_processes_name_process", :with => nombre
end

Dado(/^escribo "(.*?)" en Lugar,$/) do |lugar|
  fill_in "selection_processes_place", :with => lugar
end

Dado(/^escribo "(.*?)" en Duracion$/) do |duration|
  fill_in "selection_processes_duration", :with => duration
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

Cuando(/^presiono el boton "(.*?)"$/) do |botton|
  click_button botton #"Create Selection processes"
end

Entonces(/^se crea el premio y me muestra el mensaje "(.*?)"$/) do |msg|
  #Elemento: notice
  page.should have_content("Selection processes was successfully created.")
end

#Casos extremos
Dado(/^dejo en blanco Nombre$/) do
  fill_in "Nombre del proceso", :with => nil
end

Dado(/^dejo en blanco Lugar$/) do
  fill_in "Lugar", :with => nil
end

Entonces(/^me muestra el mensaje de error que "([^"]*)"$/) do |mensaje|
  page.should have_content("error")
end


Cuando(/^como ya existe un premio con ese nombre "(.*?)" y lugar "(.*?)"$/) do |nombre, lugar|
  @selection_process = SelectionProcesses.create!({ :name_process => nombre, :place => lugar })
end
