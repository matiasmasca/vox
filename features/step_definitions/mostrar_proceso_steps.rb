# encoding: utf-8
Cuando(/^hago click en Mostrar para "(.*?)"$/) do |process_name|
  #first("#selection-processes-list", :text => "Mostrar") #Esto no hace click!
  find("table#selection-processes-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(8)").click_on('Mostrar')
end

Entonces(/^veo toda la información del premio\.$/) do
  #save_and_open_page
  #Aca debo comprobar que se muestra la info que quiero.
  expect(page).to have_content(@selection_process.name_process)
  expect(page).to have_content(@selection_process.place)
  expect(page).to have_content(@selection_process.duration)
  expect(page).to have_content(@selection_process.start_date)
  expect(page).to have_content(@selection_process.end_date)
  expect(page).to have_content(@selection_process.process_type_id)
  expect(page).to have_content(@selection_process.state)

  #Me tiene que mostrar la info. basica del organizador y un link a más info.
  expect(page).to have_content(@selection_process.organizer.name)
  
  expect(page).to have_content("Más información")
end



