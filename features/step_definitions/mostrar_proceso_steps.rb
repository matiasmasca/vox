# encoding: utf-8
Cuando(/^hago click en Mostrar para "(.*?)"$/) do |process_name|
  first("#selection-processes-list", :text => "Mostrar") #Esto no hace click!
end

Entonces(/^veo toda la información del premio\.$/) do
  #visit selection_processes_path(@selection_process)
  click_on('Mostrar')
  #Aca debo comprobar que se muestra la info que quiero.
   	expect(page).to have_content(@selection_process.name_process)
	expect(page).to have_content(@selection_process.place)
	expect(page).to have_content(@selection_process.duration)
	expect(page).to have_content(@selection_process.start_date)
	expect(page).to have_content(@selection_process.end_date)
	expect(page).to have_content(@selection_process.process_type_id)
	expect(page).to have_content(@selection_process.state)
end



