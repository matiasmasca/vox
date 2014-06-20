# encoding: utf-8
Dado(/^existe un candidato llamado "(.*?)"$/) do |nombre|
  step %{existe un premio llamado "Premios cacatua del año" que se realizara en "Av. Siempre Viva 742"}
  step %{que existe una Categoría con: "Categoría A", "Una descripción", "3", "1"}
  step %{que existe un candidato: "#{nombre}", "Es un buen tipo".}
end

Cuando(/^hago click en "(.*?)", para eliminar el candidato$/) do |arg1|
  find("table#candidates-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(7)").click_on('Eliminar')
end

Entonces(/^se borra el candidato "(.*?)"$/) do |item_borrado|
  find("#candidates-list").should have_no_content(item_borrado)
end