# encoding: utf-8
# Crear la entidad: Nombre, Dirección, Sitio Web, email, logo.
# "ABSTRACT", Av. 9 de Julio Nro. 220, www.abstract.org.ar, /organizadores/logos/logoXXX.jpg

Dado(/^completo los datos de la organización con "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |nombre, direccion, url, correo|
  fill_in "organizer_name", :with => nombre
  fill_in "organizer_address", :with => direccion
  fill_in "organizer_web", :with => url
  fill_in "organizer_email", :with => correo
  # Crear mock
  @organizer = { "name" => nombre , "address" => direccion , "web" => url , "email" => correo }
end

Dado(/^subo una imagen que se utilizará como logo de la organización\.$/) do 
  step %{completo los datos de la organización con "Nombre A", "Dirección", "Sitio Web" y "contacto@email.com"}
  imagen_path = "/public/images/uploads/isologos/no-borrar.jpg"
  page.attach_file('organizer_image', File.join(Rails.root, imagen_path), visible: false)
end

Entonces(/^me muestra la imagen recién subida$/) do 
  @organizer = Organizer.find_by_name(@organizer["name"])

  # la pagina muestra 1 imagen. Se podria mejorar con un Scope.
  page.should have_selector(:xpath, '//img[1]') #hay 1 imagen.  
  
  # le saque el public a esta url
  file = "#{@organizer.id}.jpg"
  # puts("#{Rails.root}/public/images/uploads/isologos/#{file}")
  # esta el archivo en su lugar.
  File.exist?("#{Rails.root}/public/images/uploads/isologos/#{file}").should be_true
  
  # esta la imagen en la pagina
  img_src="/images/uploads/isologos/#{file}"

  page.find('img')['src'].include?(img_src).should be_true
  # TO-Do:
  # ojo en producción podría chocar con nombres de archivos ya creados.
  # ojo, dejaba el archivo despues de la prueba, lo borro con esto:
  if File.exist?("#{Rails.root}/public/images/uploads/isologos/#{file}")
    File.delete("#{Rails.root}/public/images/uploads/isologos/#{file}") 
  end

end

Entonces(/^me muestra la imagen de logo generica$/) do
  # la pagina muestra 1 imagen. Se podria mejorar con un Scope.
  page.should have_selector(:xpath, '//img[1]') #hay 1 imagen.
  # la pagina muestra la imagen correcta.
  img_src="/images/uploads/isologos/escudo-generico.jpg"
  page.find('img')['src'].include?(img_src).should be_true
end

Entonces(/^se crea la organización y me muestra el mensaje "(.*?)"$/) do |mensaje|
  # Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos recien creados$/) do
  # Aca debo comprobar que se muestra la info que quiero.
  expect(page).to have_content(@organizer["name"])
  expect(page).to have_content(@organizer["address"])
  expect(page).to have_content(@organizer["web"])
  expect(page).to have_content(@organizer["email"])
end

# Casos extremos.
# se controlan con las tablas de datos en el feature.

# @to-do: Falta agregar un paso que chequee si estoy en la URL correcta.