# encoding: utf-8
Cuando(/^yo edito una Organización$/) do
   click_on('Editar')
end

Cuando(/^cambio el nombre por "(.*?)", la domicilio por "(.*?)"$/) do |name, address|
  @update_name = name
  @update_address = address
  @organizer.update_attributes!({ :name => @update_name,:address => @update_address })
end

Entonces(/^veo que el nombre cambio y la domicilio cambio\.$/) do
 step %{que estoy en la pantalla de Administración de Organizaciones}
 find("table#organizers-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1)").should 	have_content(@update_name)
 find("table#organizers-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)").should	have_content(@update_address)
end

Dado(/^existe una Organización llamada "(.*?)" con domicilio en "(.*?)", sin web definida$/) do |name, address|
    #email = "unemail@test.com"
    #@organizer = Organizer.create!({ :name => name, :address => address, :email => email, :web => nil })
    @organizer.update_attributes!({ :web => nil})
end

Cuando(/^cambio web por "(.*?)"$/) do |web|
  @update_web = web
  @organizer.update_attributes!({ :web => @update_web})
end

Entonces(/^veo que la web cambio, sin afectar a nombre o dirección\.$/) do
  step %{que estoy en la pantalla de Administración de Organizaciones}
  find("table#organizers-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)").should have_content(@update_web)
end

Cuando(/^cambio "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |nombre, direccion, url, correo|
  if nombre
    fill_in "organizer_name", :with => nombre
  end

  if direccion
    fill_in "organizer_address", :with => direccion
  end

  if url
    fill_in "organizer_web", :with => url
  end

  if correo
    fill_in "organizer_email", :with => correo
  end

  click_on("Update Organizer")
end
