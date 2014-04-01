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

  
end

Dado(/^subo una imagen que se utilizará como logo de la organización\.$/) do
  imagen_path = "/public/images/uploads/isologos/no-borrar.jpg"
  attach_file('logo', File.join(Rails.root, imagen_path), visible: false)
  step %{presiono el boton "Crear"}

 #Crear mock.
 step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}
 puts("Organizer logo: #{@organizer.inspect}") 
 File.exist?("#{Rails.root}/public/images/uploads/isologos/#{@organizer.id}.jpg").should == true
  
  #public/images/uploads/isologos
  #imagen_path = "/public/uploads/logos/no_borrar.jpg"
  #@organizer.logo = File.join(Rails.root, imagen_path)

# <input type="file" multiple="multiple" accept="image/jpeg,image/gif,image/png" style="font-size: 999px; position: absolute; width: 100%; height: 100%;">
# page.driver.browser.all(:xpath, '//input[@accept="image/jpeg"]')[0].send_keys(Dir.getwd + 'img.jpg')

# Testing file uploads:
#http://candidcode.com/2009/10/20/testing-file-uploads-in-ruby-on-rails-with-rspec/
end

Entonces(/^me muestra la imagen recién subida$/) do
  step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}
  #step %{subo una imagen que se utilizará como logo de la organización.}
  
  #page.driver.browser.attach_file("//input[@id='file']", url)
  buscar = "imgLogo-#{@organizer.id}"
  contenido= "/uploads/logos/#{@organizer.id}.jpg" 
  #find(buscar).should have_content(contenido)
  expect(page).to have_selector("img[src=#{contenido}]")

end

Entonces(/^se crea la organización y me muestra el mensaje "(.*?)"$/) do |mensaje|
  #Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos recien creados$/) do
  step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}

  #Aca debo comprobar que se muestra la info que quiero.
  expect(page).to have_content(@organizer.name)
  expect(page).to have_content(@organizer.address)
  expect(page).to have_content(@organizer.web)
  expect(page).to have_content(@organizer.email)
end

#Falta agregar un paso que chequee si estoy en la URL correcta.