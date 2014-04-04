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
  #Crear mock
  step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}
end

Dado(/^subo una imagen que se utilizará como logo de la organización\.$/) do 
  #step %{existe una Organización llamada "#{"ACME"}" con domicilio en "#{"Av. Siempre Viva 742"}"}
  imagen_path = "/public/images/uploads/isologos/no-borrar.jpg"
  page.attach_file('organizer_image', File.join(Rails.root, imagen_path), visible: false)
   #imagen_path = "/public/images/uploads/isologos/no-borrar.jpg"
   #@organizer.update_attributes!({ :logo => Rack::Test::UploadedFile.new(File.join(Rails.root, imagen_path), "image/jpeg")})
   #@organizer.logo = Rack::Test::UploadedFile.new(File.join(Rails.root, imagen_path), "image/jpeg")
end

Entonces(/^me muestra la imagen recién subida$/) do 
  #la pagina muestra 1 imagen. Se podria mejorar con un Scope.
  page.should have_selector(:xpath, '//img[1]') #hay 1 imagen.
  puts("Muestra: #{@organizer.inspect}") 
  
  #le saque el public a esta url
  file = "#{@organizer.id + 1}.jpg"
  puts("#{Rails.root}/public/images/uploads/isologos/#{file}")
  File.exist?("#{Rails.root}/public/images/uploads/isologos/#{file}").should == true
  
  #ojo en producción podría chocar con nombres de archivos ya creados.
  #ojo, dejaba el archivo despues de la prueba, lo borro con esto:
  if File.exist?("#{Rails.root}//public/images/uploads/isologos/#{file}")
    File.delete("#{Rails.root}/public/images/uploads/isologos/#{file}") 
  end

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