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

Dado(/^existe un Organización llamada "(.*?)" con domicilio en "(.*?)"$/) do |name_entity, address|
  @organizer = Organizer.create!({ 
    :name => name_entity, 
    :address => address,
    :web => 'www.acme.org',
    :email => 'contact@acme.org'
    })
end

Cuando(/^hago click en "(.*?)"$/) do |button|
  #click_on button
  find_button(button).click
end

Cuando(/^presiono el boton "(.*?)"$/) do |botton|
  click_button botton #"Create Selection processes"
end

Cuando(/^selecciono el link con el texto "(.*?)"$/) do |button|
  first("", :text => button) #Esto no hace click!
end

Dado(/^se lee el texto "(.*?)"$/) do |texto|
   page.should have_content(texto)
end
