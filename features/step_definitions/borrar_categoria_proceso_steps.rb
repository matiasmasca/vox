# encoding: utf-8
Entonces(/^se borra la categoría "(.*?)"$/) do |item_borrado|
  find("#categories-list").should have_no_content(item_borrado)
end

Dado(/^existe una categoría llamada "(.*?)"$/) do |nombre_categoria|	
  step %{existe un premio llamado "Premios cacatua del año" que se realizara en "Av. Siempre Viva 742"}
  step %{que existe una Categoría con: "#{nombre_categoria}", "Una descripción", "3", "1"}
end

Cuando(/^hago click en "(.*?)", para eliminar la categoria$/) do |arg1|
 find("table#categories-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(6)").click_on('Eliminar')
end