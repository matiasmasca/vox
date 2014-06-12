#encoding: utf-8
Dado(/^que existe una Categoría con: "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |nombre, descripcion, plazas, proceso_id|
    #step %{existe un premio llamado "Premios cacatua del año" que se realizara en "Av. Siempre Viva 742"}
    @category = Category.create!({ 
    :name => nombre, 
    :description => descripcion,
    :bench => plazas,
    :selection_process_id => @selection_process.id.to_i #Aca tendria que ir un proceso mockeado.
    })
end

Cuando(/^yo edito una Categoría$/) do
 click_on('Editar')
end

Cuando(/^cambio el nombre por "(.*?)", el nro\. de plazas por "(.*?)"$/) do |nombre, plazas|
  @update_name = nombre
  @update_plazas = plazas
  @category.update_attributes!({ :name => @update_name,:bench => @update_plazas })

  if nombre
    fill_in "category_name", :with => nombre
  end

  if plazas
    fill_in "category_bench", :with => plazas
  end

  click_on("Guardar Cambios")
end

Entonces(/^veo que el nombre cambio y el nro\. de plazas cambio\.$/) do
  step %{que estoy en la pantalla de "administración de Categorías"}
  #save_and_open_page
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1)").should have_content(@update_name)
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)").should	have_content(@update_plazas)
end

Cuando(/^modifico de la categoría los datos "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |nombre, descripcion, plazas, proceso_id|
  if nombre
    fill_in "category_name", :with => nombre
  end

  if descripcion
    fill_in "category_description", :with => descripcion
  end

  if plazas
    fill_in "category_bench", :with => plazas
  end

  if proceso_id
    fill_in "category_selection_process_id", :with => proceso_id
  end

  click_on("Guardar Cambios")
end


Cuando(/^yo edito la (\d+)da\. Categoría$/) do |arg1|
  #save_and_open_page	
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(5)").click_on('Editar')
             #categories-list > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(5) > a:nth-child(1)
end

Dado(/^que existe una Categoría llamada "(.*?)" con "(.*?)" plazas, sin descripción definidoa$/) do |nombre, plazas|
  @category.update_attributes!({ :description => nil })
end

Cuando(/^cambio la descripción por "(.*?)"$/) do |descripcion|
  @update_description = descripcion
  @category.update_attributes!({ :description => @update_description})
end

Entonces(/^veo que la descripción cambio, sin afectar al nombre de usuario o la cantidad de plazas\.$/) do
  step %{que estoy en la pantalla de "administración de Categorías"}
  #save_and_open_page
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1)").should have_content(@category.name)
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)").should	have_content(@update_description)
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)").should have_content(@category.bench)
end




