# encoding: utf-8
Dado(/^que existe un candidato: "(.*?)", "(.*?)"\.$/) do |nombre, bios|
  #debe existir proceso y categoria primero.
    @candidato = Candidate.create!({ 
    :name => nombre, 
    :bios => bios,
    :category_id => @category.id.to_i #Aca tendria que ir una categoria mockeado.
    })
end

Dado(/^modifico del candidato los datos "(.*?)", "(.*?)"$/) do |nombre, bios|
  if nombre
    fill_in "candidate_name", :with => nombre
  end

  if bios
    fill_in "candidate_bios", :with => bios
  end

  click_on("Guardar Cambios")
  
  @update_name = nombre
  @update_bios = bios
  @candidato.update_attributes!({:name => @update_name,:bios => @update_bios })
  #save_and_open_page 
end

Dado(/^modifico del candidato: "(.*?)", "(.*?)"$/) do |nombre, bios|
  #Esto esta como repetido, porque daba error en las validaciones, cuando le ponemos el update.
  if nombre
    fill_in "candidate_name", :with => nombre
  end

  if bios
    fill_in "candidate_bios", :with => bios
  end

  click_on("Guardar Cambios")
end

Dado(/^cambio el nombre$/) do
  steps %{modifico del candidato los datos "Cambiando el nombre", ""} 
end

Entonces(/^veo que el "(.*?)" cambio\.$/) do |atributo|
  #step %{que estoy en la pantalla de "administración de Candidatos"}
  #save_and_open_page
  find("div.col-xs-12:nth-child(3) > p:nth-child(3)").should have_content(@update_name) if atributo == "nombre"
  find("div.container:nth-child(2) > p:nth-child(3)").should have_content(@update_bios) if atributo == "bios"

  #find("table#candidates-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1)").should have_content(@category.name)
  #find("table#candidates-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)").should have_content(@update_description)
  #find("table#candidates-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)").should have_content(@category.bench)
end

Dado(/^que existe un candidato, sin foto\.$/) do
  @candidato.update_attributes!({:url_image => nil  })
end

Dado(/^que existe un candidato, con foto\.$/) do
  pending # express the regexp above with the code you wish you had
end

Cuando(/^yo edito un (\d+)do\. Candidato$/) do |arg1|
  steps %{Y que existe un candidato: "Manolillo", "Es un tipazo".}
  steps %{Y que estoy en la pantalla de "administración de Candidatos"}
  find("table#candidates-list > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(6)").click_on('Editar')
end

Cuando(/^modifico del (\d+)do\. candidato los datos "(.*?)", "(.*?)"$/) do |arg1, nombre, bios|
 steps %{Y modifico del candidato los datos "#{nombre}", "#{bios}"
         Cuando presiono el botón "Guardar Cambios"
         me muestra el mensaje de error que "ese nombre ya está siendo utilizado" }
end
