# encoding: utf-8
Dado(/^completo los datos de mi categoría con "(.*?)", "(.*?)", "(.*?)"$/) do |nombre, descripcion, plazas|
   fill_in "category_name", :with => nombre
   fill_in "category_description", :with => descripcion
   fill_in "category_bench", :with => plazas
   #fill_in "category_selection_process_id", :with => id #Esto no va cuando lo hace un usuario.
   
   #Crear mock
   # el proceso ya esta mokeado.
   @categoria = {"selection_process_id" => @selection_process.id, "name" => nombre,"description" => descripcion, "bench" => plazas}
end



# Dado(/^como ya existe una categoría con ese nombre "(.*?)"$/) do |arg1|
#    @categoria = Category.create!({"selection_process_id" => @selection_process.id, "name" => nombre, "description" => "una descripción", "bench" => "5"})   
# end