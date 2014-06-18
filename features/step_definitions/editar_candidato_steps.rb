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
  @update_name = nombre
  @update_bios = bios
  @candidato.update_attributes!({ :name => @update_name,:bios => @update_bios })

  if nombre
    fill_in "candidate_name", :with => nombre
  end

  if plazas
    fill_in "candidate_bios", :with => bios
  end

  click_on("Guardar Cambios")
end

Dado(/^cambio el nombre$/) do
  steps %{modifico del candidato los datos "Cambiando el nombre", ""} 
end

Entonces(/^veo que el "(.*?)" cambio\.$/) do |atributo|
  pending # express the regexp above with the code you wish you had
  #step %{que estoy en la pantalla de "administración de Categorías"}
  #save_and_open_page
  step %{que estoy en la pantalla de "administración de Candidatos"}
  #save_and_open_page
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1)").should have_content(@category.name)
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)").should have_content(@update_description)
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)").should have_content(@category.bench)


end

Dado(/^que existe un candidato, sin foto\.$/) do
  pending # express the regexp above with the code you wish you had
end

Dado(/^que existe un candidato, con foto\.$/) do
  pending # express the regexp above with the code you wish you had
end

Cuando(/^yo edito un (\d+)do\. Candidato$/) do |arg1|
  pending # express the regexp above with the code you wish you had
    #save_and_open_page 
  find("table#categories-list > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(5)").click_on('Editar')
             #categories-list > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(5) > a:nth-child(1)

end

Cuando(/^modifico del (\d+)do\. candidato los datos "(.*?)", "(.*?)"$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end
