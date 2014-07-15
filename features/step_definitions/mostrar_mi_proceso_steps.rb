#encoding: utf-8

Cuando(/^B trata de ver el premio de A$/) do
#http://0.0.0.0:3000/organizers/9/selection_processes/17

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
  
  visit(organizer_selection_process_path(org_id, process_id))
  #save_and_open_page
end


