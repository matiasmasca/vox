#encoding: utf-8
Cuando(/^yo edito mi Proceso$/) do
  #modificar cuando este el front end de usuarios.}
  save_and_open_page
  click_on("Editar")
  #save_and_open_page
  #first(:link, 'Modificar Proceso').click
  

end

Dado(/^que existe un Proceso: "(.*?)", "(.*?)", "(.*?)" asociado a mi organizacion "(.*?)"\.$/) do |name_process, place, duration, organizer_name|
  if organizer_name
     organizer = Organizer.find_by_name("#{organizer_name}")
     organizer_id = organizer.id
  else
     organizer_id = 1
  end
 
  @selection_process = SelectionProcess.create!({ 
  	:name_process => name_process, 
  	:place => place,
  	:duration => duration,
  	:start_date => '2014-07-01',
  	:end_date => '2014-09-01',
    :process_type_id => '1',
    :state => 'nuevo',
    :organizer_id => organizer_id
    }) 
end

Cuando(/^yo edito el (\d+)do\. premio$/) do |nro_proceso|
  @segundo_premio = SelectionProcess.last
  #path = "edit_organizer_selection_process_path(#{@segundo_premio.organizer_id},#{@segundo_premio.id})"
  path = "/organizers/#{@segundo_premio.organizer_id}/selection_processes/#{@segundo_premio.id}/edit"
  visit(path)

end

Cuando(/^cambio, de mi proceso: "(.*?)", "(.*?)" o "(.*?)"$/) do |nombre, place, duration|
   if nombre
    fill_in "selection_process_name_process", :with => nombre
  end

  if place
    fill_in "selection_process_place", :with => place
  end

  if duration
    fill_in "selection_process_duration", :with => duration
  end

  #save_and_open_page
  click_on("Guardar cambios")
end

Cuando(/^B trata de modificar el premio de A$/) do
    @organizer = Organizer.create!({ 
    :name => "Oranizacion Pepito", 
    :address => "una dirección",
    :web => "www.Pepito.com.ar",
    :email => "info@pepito.com",
    :logo => nil,
    :user_id => @usuarioA.id
    })
  
    @organizer2 = Organizer.create!({ 
    :name => "Oranizacion Moniquita", 
    :address => "una dirección",
    :web => "www.moniquita.com.ar",
    :email => "info@moniquita.com",
    :logo => nil,
    :user_id => @usuarioB.id
    })

  #puts(@usuarioB.id)
  #puts(@organizer.id)

  usuario_id = @usuarioB.id
  org_id = @organizer.id
  process_id = @selection_process.id
  
  visit(edit_organizer_selection_process_path(org_id, process_id))
  #save_and_open_page
end

