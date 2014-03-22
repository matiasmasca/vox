# encoding: utf-8
#Crear la entidad: Nombre, Dirección, Sitio Web, email, logo.
#"ABSTRACT", Av. 9 de Julio Nro. 220, www.abstract.org.ar, /organizadores/logos/logoXXX.jpg
Dado(/^que estoy en la pantalla de administración y hago click en "(.*?)"$/) do |boton|
  visit("paginas/home")
  click_on boton
  #Aca deberia estar en /organizers/new falta algo que cheque la URL.
  visit("/organizers/new")
end

Dado(/^completo los datos de la organización: Nombre, Dirección, Sitio Web, email$/) do
  fill_in "organizer_name", :with => "ACME"
  fill_in "organizer_address", :with => "Av. Siempre Viva 742"
  fill_in "organizer_web", :with => "www.acme.org"
  fill_in "organizer_email", :with => "contact@acme.org"

  #Crear mock.
  step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}
end

Dado(/^subo una imagen que se utilizará como logo de la organización\.$/) do
  pending # express the regexp above with the code you wish you had
end

Entonces(/^se crea la organización y me muestra el mensaje "(.*?)"$/) do |mensaje|
  #Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos recien creados$/) do
  #Aca debo comprobar que se muestra la info que quiero.
  expect(page).to have_content(@organizer.name)
  expect(page).to have_content(@organizer.address)
  expect(page).to have_content(@organizer.web)
  expect(page).to have_content(@organizer.email)
end

#Falta agregar un paso que chequee si estoy en la URL correcta.