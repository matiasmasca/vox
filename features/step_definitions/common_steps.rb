# encoding: utf-8
Dado(/^existe un premio llamado "(.*?)" que se realizara en "(.*?)"$/) do |name_process, place|
  step %{existe una Organización: "ComunidadTIC", "Internet, La Plata, Buenos Aires, Argentina", "" y "contacto@comunidadtic.com.ar"} if @organizer == nil
  
  @selection_process = SelectionProcess.create!({ 
  	:name_process => name_process, 
  	:place => place,
  	:duration => 30,
  	:start_date => '2014-07-01',
  	:end_date => '2014-09-01',
    :process_type_id => '1',
    :state => 'nuevo',
    :organizer_id => @organizer.id.to_i
  	})
end

Dado(/^existe una Organización: "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |name_entity, address, web, email|
  @organizer = Organizer.create!({ 
    :name => name_entity, 
    :address => address,
    :web => web,
    :email => email,
    :logo => nil,
    :user_id => 1
    })
end

Dado(/^existe una Organización: "(.*?)", "(.*?)", "(.*?)" y "(.*?)" asociada al usuario "(.*?)".$/) do |name_entity, address, web, email, usuario|
    if usuario
      usuario = User.find_by_usuario("#{usuario}")
      user_id = usuario.id
    else
      user_id = 1
    end

    @organizer = Organizer.create!({ 
    :name => name_entity, 
    :address => address,
    :web => web,
    :email => email,
    :logo => nil,
    :user_id => user_id
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

Dado(/^existen (\d+) usuarios A y B$/) do |cantidad|
  @usuarioA = User.create!({"usuario" => "usuario01","nombre" => "nombre","apellido" => "apellido", "email" => "email@usuarioA.com", "clave" => "clave1234", "facebook" => "facebook", "twitter" => "twitter", "tipo_usuario_id" => 3 })
  @usuarioB = User.create!({"usuario" => "usuario02","nombre" => "nombre","apellido" => "apellido", "email" => "email@usuarioB.com", "clave" => "clave1234", "facebook" => "facebook", "twitter" => "twitter", "tipo_usuario_id" => 3 })
end

Dado(/^existe una Organización llamada "(.*?)" con domicilio en "(.*?)" y email "(.*?)"$/) do |name, address, email|
  step %{existe una Organización: "#{name}", "#{address}", "" y "#{email}"}
end

Cuando(/^hago click en "(.*?)"$/) do |button|
  #click_on button
  #save_and_open_page
  find_button(button).click
end
Cuando(/^(?:presiono|que presione) el botón "(.*?)"$/) do |button|
  #save_and_open_page
  #click_button button #me da problemas con Capybara.
  #find_button(button).click #me da problemas con Capybara.
  click_on(button)
  
end

Dado(/^que estoy en la pantalla de administración y hago click en "(.*?)"$/) do |botton|
  visit(paginas_home_path)
  click_on botton
  
  #@to-do: chequear uri correcta
  #Aca deberia estar en /organizers/new falta algo que cheque la URL.
  #visit("/organizers/new")
end

Cuando(/^selecciono el link con el texto "(.*?)"$/) do |button|
  first("", :text => button) #Esto no hace click!
end

Dado(/^se lee el texto "(.*?)"$/) do |texto|
   page.should have_content(texto)
end

Dado(/^que estoy en la pantalla de "(.*?)"$/) do |pantalla|
  case pantalla
  when "administración de Usuarios"
    visit("/users")
  when "Administración de Organizaciones"
    visit("/organizers")
  when "mis procesos electorales"
    visit("/selection_processes")
  when "administración de Categorías"
    visit("/categories")
  when "administración de Candidatos"
    visit("/candidates")
  when "Modificar Organización"
    visit("/paginas/home")
  when "dashboard usuario"
    visit("/paginas/user_dashboard")
    #save_and_open_page 
  when "Modificar Proceso"
    visit("/paginas/user_dashboard")
    #save_and_open_page
  else
    visit("/¿A donde queres ir?")
  end

end

#TO-Do: refactorizar estos 2 en el Case de arriba.
Dado(/^que estoy en la pantalla de mis procesos electorales$/) do
  visit("/selection_processes")
end

Dado(/^que estoy en la pantalla de Administración de Organizaciones$/) do
  #visit organizers_path
  visit("/organizers/")
end
#---


#To-do: refactorizar estos pasos en 1.
Entonces(/^veo el mensaje "(.*?)"$/) do |mensaje|
  page.should have_content(mensaje)
end

Entonces(/^me muestra el mensaje "(.*?)"$/) do |mensaje|
  page.should have_content(mensaje)
end

#Login
Dado(/^que estoy logueado como "(.*?)"$/) do |tipo_usuario|
  #'Admin'=> '1', 'Jurado'=> '2', 'Organizador'=> '3'
  case tipo_usuario
  when "Organizador"
   step %{existe un Usuario: "shinjiikari", "shinji@ikari.com.ar", "neogenesis" y "3"}
   step %{existe una Organización: "Nerv Corp.", "Nueva nueva tokio", "" y "eva01@nerv.com" asociada al usuario "#{@user.usuario}".}
   #funcionan esos steps...
  when "Jurado"
   step %{existe un Usuario: "shinjiikari", "shinji@ikari.com.ar", "neogenesis" y "2"}
  when "Admin"
   step %{existe un Usuario: "shinjiikari", "shinji@ikari.com.ar", "neogenesis" y "1"}
  else
    visit("/¿Quien sos?¡A donde queres ir!")
  end
end




#Casos extremos, errores y problemas.
Entonces(/^me muestra el mensaje de error que "([^"]*)"$/) do |mensaje|
  page.should have_content("error")
end
