# encoding: utf-8

Dado(/^completo los datos de la categoria con "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |nombre, descripcion, plazas, id|
  fill_in "category_name", :with => nombre
  fill_in "category_description", :with => descripcion
  fill_in "category_bench", :with => plazas
  fill_in "category_selection_process_id", :with => id.to_i

  #Crear mock
  @categoria = {"selection_process_id" => id, "name" => nombre,"description" => descripcion, "bench" => plazas}
end

Entonces(/^se crea la categoria y me muestra el mensaje "(.*?)"$/) do |mensaje|
  #TO-DO: esto se puede refactorizar para poner en common
  #Elemento: notice
  page.should have_content(mensaje)
end

Entonces(/^me muestra los datos de la categoria recien creada$/) do
  #Aca debo comprobar que se muestra la info que quiero.
  expect(page).to have_content(@categoria["name"])
  expect(page).to have_content(@categoria["description"])
  expect(page).to have_content(@categoria["bench"])
  expect(page).to have_content(@categoria["selection_process_id"])
end

Dado(/^completo los datos de la categoria con "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  pending # express the regexp above with the code you wish you had
end
