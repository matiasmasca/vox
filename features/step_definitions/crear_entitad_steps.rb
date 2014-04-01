# encoding: utf-8
#Crear la entidad: Nombre, Dirección, Sitio Web, email, logo.
#"ABSTRACT", Av. 9 de Julio Nro. 220, www.abstract.org.ar, /organizadores/logos/logoXXX.jpg
Dado(/^que estoy en la pantalla de administración y hago click en "(.*?)"$/) do |boton|
  visit(paginas_home_path)
  click_on boton
  #Aca deberia estar en /organizers/new falta algo que cheque la URL.
  #visit("/organizers/new")
end

Dado(/^completo los datos de la organización: Nombre, Dirección, Sitio Web, email$/) do
  fill_in "organizer_name", :with => "ACME"
  fill_in "organizer_address", :with => "Av. Siempre Viva 742"
  fill_in "organizer_web", :with => "www.acme.org"
  fill_in "organizer_email", :with => "contact@acme.org" 
end

Dado(/^subo una imagen que se utilizará como logo de la organización\.$/) do
 
 #Crear mock.
 step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}

  imagen_path = "/public/images/uploads/isologos/no-borrar.jpg"
  page.attach_file('logo', File.join(Rails.root, imagen_path), visible: false)
  
  #step %{presiono el boton "Crear"}

 
 
 # mostrar valores actuales en consola:
 puts("Organizer logo: #{@organizer.inspect}") 
 
 File.exist?("#{Rails.root}/public/images/uploads/isologos/#{@organizer.id}.#{@organizer.logo}").should == true
  
  #ojo deja el archivo despues de la prueba, tendrías que borrarlo.
  #  def cleanup
  #  File.delete("#{Rails.root}/public/images/uploads/isologos/#{@organizer.id}") 
  #       if File.exist?("#{Rails.root}//public/images/uploads/isologos/#{@organizer.id}")
  #end

# Testing file uploads:
#http://candidcode.com/2009/10/20/testing-file-uploads-in-ruby-on-rails-with-rspec/
end

Entonces(/^me muestra la imagen recién subida$/) do
  #step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}
  #step %{subo una imagen que se utilizará como logo de la organización.}
  
  buscar = "imgLogo-#{@organizer.id}"
  page.should have_selector(:xpath, '//img[1]') #hay 1 imagen.
  page.should have_selector(:xpath, "//#{buscar}") #la imagen tiene el id correcto.                                
end

Entonces(/^se crea la organización y me muestra el mensaje "(.*?)"$/) do |mensaje|
  #Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos recien creados$/) do
  #step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}
  #Aca debo comprobar que se muestra la info que quiero.
  expect(page).to have_content(@organizer.name)
  expect(page).to have_content(@organizer.address)
  expect(page).to have_content(@organizer.web)
  expect(page).to have_content(@organizer.email)
end

#Falta agregar un paso que chequee si estoy en la URL correcta.