# encoding: utf-8

Cuando(/^yo edito el premio$/) do
  #visit edit_selection_processes_path(@selection_process)
  click_on('Editar')
end

Cuando(/^cambio el nombre por "(.*?)" y el lugar por "(.*?)"$/) do |name_process, place|
  @update_name_process = name_process
	@update_pace = place
	@selection_process.update_attributes!({ :name_process => @update_name_process,:place => @update_pace })
end

Entonces(/^veo que el nombre cambio y la dirección cambio\.$/) do
  	step %{que estoy en la pantalla de mis procesos electorales}
	find("table#selection-processes-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1)").should 	have_content(@update_name_process)
	find("table#selection-processes-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)").should	have_content(@update_pace)
end

Dado(/^existe un premio llamado "(.*?)" que se realizara en "(.*?)", sin duración definida$/) do |name_process, place|
  @selection_process = SelectionProcesses.create!({ :name_process => name_process, :place => place, :duration => nil })
end

Cuando(/^cambio el duracion por "(.*?)"$/) do |duration|
 	@update_duration = duration
	@selection_process.update_attributes!({ :duration => @update_duration})
end

Entonces(/^veo que la duración cambio, sin afectar a nombre o lugar\.$/) do
  step %{que estoy en la pantalla de mis procesos electorales}
  find("table#selection-processes-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)").should 	have_content(@update_duration)
end
