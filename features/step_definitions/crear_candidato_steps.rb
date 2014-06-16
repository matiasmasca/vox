# encoding: utf-8
Dado(/^completo los datos del candidato con "(.*?)", "(.*?)"$/) do |nombre, bios|
  steps %{Y existe un premio llamado "Premios cacatua del año 2222" que se realizara en "Av. Siempre Viva 742"}
  steps %{Y que existe una Categoría con: "Categoría ABC", "Una descripción", "3", "1"}


  fill_in "candidate_name", :with => nombre
  fill_in "candidate_bios", :with => bios
  #Crear mock
  # el proceso ya esta mokeado.
  #la categoria esta mokeada.
  @candidato = {"category_id" => @categoria.id, "name" => nombre,"bios" => bios}
  puts(@category.inspect)
  save_and_open_page
end

Entonces(/^se crea el candidato y me muestra el mensaje "(.*?)"$/) do |mensaje|
  #TO-DO: esto se puede refactorizar para poner en common
  #Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos del candidato recien creado$/) do
  #TO-DO: habría que buscar la forma de generalizar esto para todas las features.
  expect(page).to have_content(@candidate["name"])
  expect(page).to have_content(@candidate["bios"])
end


Dado(/^subo una imagen que se utilizará como avatar del candidato\.$/) do
  pending # express the regexp above with the code you wish you had
end

Dado(/^como ya existe un candidato con ese nombre "(.*?)"$/) do |nombre|
  @candidato = Candidate.create!({"category_id" => @categoria.id, "name" => nombre, "bios" => "una descripción del candidato"})
end

#No olvides de validar los mensajes!