# encoding: utf-8
Cuando(/^yo edito mi Organización$/) do
  click_on("Modificar mi Organización")
end

Cuando(/^A trata de modificar la organizacion de B$/) do
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

  usuario_id = @usuarioB.id
  org_id = @organizer.id
  
  visit(edit_user_organizer_path(usuario_id , org_id))
end

Entonces(/^veo que el nombre de mi organización cambio y el domicilio cambio\.$/) do
 click_on("Guardar cambios")
 step %{veo el mensaje "Organización actualizada correctamente."}
 find("div.col-xs-12:nth-child(3) > p:nth-child(2)").should have_content("Nombre de la Organización: #{@update_name}")
 find("div.col-xs-12:nth-child(3) > p:nth-child(3)").should have_content("Lugar: #{@update_address}")

end

Entonces(/^veo que mi sitio web cambio, sin afectar a nombre o dirección\.$/) do
 click_on("Guardar cambios")
 step %{veo el mensaje "Organización actualizada correctamente."}
 find("div.col-xs-12:nth-child(3) > p:nth-child(4) > a:nth-child(2)").should have_content("#{@update_web}")
end