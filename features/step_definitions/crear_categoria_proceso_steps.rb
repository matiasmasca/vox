# encoding: utf-8
Dado(/^completo los datos de la categoría con "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |nombre, descripcion, plazas, id|
  fill_in "category_name", :with => nombre
  fill_in "category_description", :with => descripcion
  fill_in "category_bench", :with => plazas
  fill_in "category_selection_process_id", :with => id

  #Crear mock
  # el proceso ya esta mokeado.
  @categoria = {"selection_process_id" => @selection_process.id, "name" => nombre,"description" => descripcion, "bench" => plazas}
end

Entonces(/^se crea la categoría y me muestra el mensaje "(.*?)"$/) do |mensaje|
  #TO-DO: esto se puede refactorizar para poner en common
  #Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos de la categoría recién creada$/) do
  #Aca debo comprobar que se muestra la info que quiero.
  expect(page).to have_content(@categoria["name"])
  expect(page).to have_content(@categoria["description"])
  expect(page).to have_content(@categoria["bench"])
  expect(page).to have_content(@selection_process["name_process"])
end

Dado(/^como ya existe una categoría con ese nombre "(.*?)"$/) do |nombre|
 @categoria = Category.create!({"selection_process_id" => @selection_process.id, "name" => nombre, "description" => "una descripción", "bench" => "5"})   
end