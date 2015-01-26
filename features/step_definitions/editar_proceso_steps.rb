# encoding: utf-8
Cuando(/^yo edito el premio$/) do
  click_on('Editar')
end

Cuando(/^cambio el nombre por "(.*?)" y el lugar por "(.*?)"$/) do |name_process, place|
  @update_name_process = name_process
  @update_pace = place
  @selection_process.update_attributes!({ :name_process => @update_name_process , :place => @update_pace })
end

Entonces(/^veo que el nombre cambio y la dirección cambio\.$/) do
  step %{que estoy en la pantalla de "Mis procesos"}
  find("table#selection-processes-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1)").should  have_content(@update_name_process)
  find("table#selection-processes-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)").should  have_content(@update_pace)
end

Dado(/^existe un premio llamado "(.*?)" que se realizara en "(.*?)", sin duración definida$/) do |name_process, place|
  @selection_process = SelectionProcess.create!({ :name_process => name_process , :place => place , :duration => nil , :organizer_id => 1 })
end

Cuando(/^cambio el duracion por "(.*?)"$/) do |duration|
  @update_duration = duration
  @selection_process.update_attributes!({ :duration => @update_duration })
end

Entonces(/^veo que la duración cambio, sin afectar a nombre o lugar\.$/) do
  step %{que estoy en la pantalla de mis procesos electorales}
  find("table#selection-processes-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)").should  have_content(@update_duration)
end

Cuando(/^cambio "(.*?)", "(.*?)" o "(.*?)"$/) do |nombre, place, duration|
  if nombre
    fill_in "selection_process_name_process", :with => nombre
  end

  if place
    fill_in "selection_process_place", :with => place
  end

  if duration
    fill_in "selection_process_duration", :with => duration
  end

  click_on("Guardar cambios")
end

Cuando(/^yo edito otro premio$/) do
  find("table#selection-processes-list > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(9)").click_on('Editar')
end