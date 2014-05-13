# encoding: utf-8
Dado(/^que estoy en la pantalla de mis procesos electorales$/) do
  visit("/selection_process")
end

Dado(/^existe un premio llamado "(.*?)" que se realizara en "(.*?)"$/) do |name_process, place|
  @selection_process = SelectionProcesses.create!({ 
  	:name_process => name_process, 
  	:place => place,
  	:duration => 30,
  	:start_date => '2014-07-01',
  	:end_date => '2014-09-01',
    :process_type_id => '1',
    :state => 'nuevo'
  	})
end

Dado(/^que estoy en la pantalla de Administración de Organizaciones$/) do
  #visit organizers_path
  visit("/organizers/")
end

Dado(/^existe una Organización: "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |name_entity, address, web, email|
  @organizer = Organizer.create!({ 
    :name => name_entity, 
    :address => address,
    :web => web,
    :email => email,
    :logo => nil
    })
end

Dado(/^existe un Usuario: "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |usuario, email, clave, tipo|
    @user = User.create!({ 
    :usuario => usuario, 
    :email => email,
    :clave => clave,
    :tipo_usuario_id => tipo
    })
end

Dado(/^existe una Organización llamada "(.*?)" con domicilio en "(.*?)" y email "(.*?)"$/) do |name, address, email|
  step %{existe una Organización: "#{name}", "#{address}", "" y "#{email}"}
end


Cuando(/^hago click en "(.*?)"$/) do |button|
  #click_on button
  find_button(button).click
end

Cuando(/^presiono el boton "(.*?)"$/) do |botton|
  click_button botton #"Create Selection processes"
end

Cuando(/^presiono el botón "(.*?)"$/) do |botton|
  click_button botton #"Create Selection processes"
end

Cuando(/^selecciono el link con el texto "(.*?)"$/) do |button|
  first("", :text => button) #Esto no hace click!
end

Dado(/^se lee el texto "(.*?)"$/) do |texto|
   page.should have_content(texto)
end

Dado(/^que estoy en la pantalla de "(.*?)"$/) do |pantalla|
  case pantalla
  when "administración de usuarios"
    visit("/users")
  else
    "¿A donde queres ir?"
  end

end

#Casos extremos, errores y problemas.
Entonces(/^me muestra el mensaje de error que "([^"]*)"$/) do |mensaje|
  page.should have_content("error")
end