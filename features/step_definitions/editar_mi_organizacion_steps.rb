#encoding: utf-8
Cuando(/^yo edito mi Organización$/) do
  #modificar cuando este el front end de usuarios.}
  #save_and_open_page
  click_on("Modificar Organización")
end



Cuando(/^B trata de modificar la organizacion de A$/) do
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
  
  visit(edit_user_organizer_path(usuario_id , org_id))
  #visit("/users/#{usuario_id}/organizers/#{org_id}/edit")
  #save_and_open_page
end

