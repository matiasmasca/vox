# encoding: utf-8
Dado(/^completo los datos del candidato con "(.*?)", "(.*?)"$/) do |nombre, bios|
  #Crear mock
  # Mock proceso.
  steps %{Y existe un premio llamado "Premios cacatua del año 2222" que se realizara en "Av. Siempre Viva 742"}
  # Mock categoria.
  steps %{Y que existe una Categoría con: "Categoría ABC", "Una descripción", "3", "1"}
  @candidato = {"category_id" => @category.id, "name" => nombre,"bios" => bios}
  #save_and_open_page
 
  fill_in "candidate_name", :with => nombre
  fill_in "candidate_bios", :with => bios
  fill_in "candidate_category_id", :with => @category.id.to_i
  
end

Entonces(/^se crea el candidato y me muestra el mensaje "(.*?)"$/) do |mensaje|
  #TO-DO: esto se puede refactorizar para poner en common
  #Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos del candidato recien creado$/) do
  #TO-DO: habría que buscar la forma de generalizar esto para todas las features.
  expect(page).to have_content(@candidato["name"])
  expect(page).to have_content(@candidato["bios"])
end

Dado(/^subo una imagen que se utilizará como avatar del candidato\.$/) do
  # Mock proceso.
  #steps %{Y existe un premio llamado "Premios cacatua del año 2222" que se realizara en "Av. Siempre Viva 742"}
  # Mock categoria.
  #steps %{Y que existe una Categoría con: "Categoría ABC", "Una descripción", "3", "1"}
  imagen_path = "/public/images/uploads/isologos/no-borrar.jpg"
  page.attach_file('candidate_avatar_file', File.join(Rails.root, imagen_path), visible: false)
end

Dado(/^como ya existe un candidato con ese nombre "(.*?)"$/) do |nombre|
  @candidato = Candidate.create!({"category_id" => @category.id, "name" => nombre, "bios" => "una descripción del candidato"})
end

Entonces(/^me muestra la imagen del "(.*?)" recién subida$/) do |imagen_de|
  #la pagina muestra 1 imagen. Se podria mejorar con un Scope.
  page.should have_selector(:xpath, '//img[1]') #hay 1 imagen.  
  
  #le saque el public a esta url
  #file = "#{@candidato.id + 1}.jpg"
  file = "#{1}.jpg"
  puts("#{Rails.root}/public/images/uploads/avatars/candidatos/#{file}")
  # esta el archivo en su lugar.
  File.exist?("#{Rails.root}/public/images/uploads/avatars/candidatos/#{file}").should be_true
  
  # esta la imagen en la pagina
  img_src="/images/uploads/avatars/candidatos/#{file}"
  #puts("Muestra: #{@organizer.inspect}") 
  #save_and_open_page 

  page.find('img')['src'].include?(img_src).should be_true
  #ojo en producción podría chocar con nombres de archivos ya creados.
  #ojo, dejaba el archivo despues de la prueba, lo borro con esto:
  if File.exist?("#{Rails.root}/public/images/uploads/avatars/candidatos/#{file}")
    File.delete("#{Rails.root}/public/images/uploads/avatars/candidatos/#{file}") 
  end

end

Entonces(/^me muestra un avatar generico$/) do
  #la pagina muestra 1 imagen. Se podria mejorar con un Scope.
  page.should have_selector(:xpath, '//img[1]') #hay 1 imagen.
  #la pagina muestra la imagen correcta.
  img_src="/images/uploads/avatars/candidatos/avatar-generico.png"
  page.find('img')['src'].include?(img_src).should be_true
end




#No olvides de validar los mensajes del controlador!