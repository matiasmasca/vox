# language: es
Dado(/^que estoy en la pantalla de mis procesos electorales y hago click en "New Selection processes"$/) do
  visit("/selection_process")
  click_on "New Selection processes"
end

Dado(/^escribo "(.*?)" en Nombre$/) do |nombre|
	fill_in "Name process", :with => nombre
end

Dado(/^escribo "(.*?)" en Lugar,$/) do |lugar|
  fill_in "Place", :with => lugar
end

Dado(/^escribo "(.*?)" en Duracion$/) do |duration|
  fill_in "Duration", :with => duration
end

Dado(/^selecciono "(.*?)" en Fecha Inicio$/) do |start_date|
  select_date(start_date, :from => "Start date")
end

Dado(/^selecciono "(.*?)" en Fecha Cierre$/) do |end_date|
  select_date(end_date, :from => "End date")
end

Dado(/^en Tipo de Proceso selecciono "(.*?)"$/) do |tipo|
 select tipo, :from => "Process type"
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
  fill_in "Name process", :with => nil
end

Dado(/^dejo en blanco Lugar$/) do
  fill_in "Place", :with => nil
end

Entonces(/^me muestra el mensaje de error que "([^"]*)"$/) do |mensaje|
  page.should have_content("error")
end


Cuando(/^como ya existe un premio con ese nombre "(.*?)" y lugar "(.*?)"$/) do |nombre, lugar|
  @selection_process = SelectionProcesses.create!({ :name_process => nombre, :place => lugar })
end
