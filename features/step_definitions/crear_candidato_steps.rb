# encoding: utf-8
Dado(/^completo los datos del candidato con "(.*?)", "(.*?)"$/) do |nombre, bios|
  fill_in "candidate_name", :with => nombre
  fill_in "candidate_bios", :with => bios
  #Crear mock
  # el proceso ya esta mokeado.
  @candidato = {"category_id" => @category.id, "name" => nombre,"bios" => bios}
end

Entonces(/^se crea el candidato y me muestra el mensaje "(.*?)"$/) do |mensaje|
  #TO-DO: esto se puede refactorizar para poner en common
  #Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos del candidato recien creados$/) do
  #TO-DO: habría que buscar la forma de generalizar esto para todas las features.
  expect(page).to have_content(@candidato["name"])
  expect(page).to have_content(@candidato["bios"])
end

Dado(/^subo una imagen que se utilizará como avatar del candidato\.$/) do
  pending # express the regexp above with the code you wish you had
end

Dado(/^como ya existe un candidato con ese nombre "(.*?)"$/) do |nombre|
  @categoria = Category.create!({"category_id" => @category.id, "name" => nombre, "bios" => "una descripción del candidato"})
end

#No olvides de validar los mensajes!