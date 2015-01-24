# encoding: utf-8
Dado(/^existe un premio llamado "(.*?)" que se realizara en "(.*?)"$/) do |name_process, place|
  step %{existe una Organización: "ComunidadTIC", "Internet, La Plata, Buenos Aires, Argentina", "" y "contacto@comunidadtic.com.ar"} if @organizer == nil
    if @organizer.nil?
        organizer_id = 1
      else
        organizer_id = @organizer.id.to_i    
    end

   @selection_process = SelectionProcess.create!( { 
    	:name_process => name_process, 
    	:place => place,
    	:duration => 30,
    	:start_date => '2014-07-01',
    	:end_date => '2014-09-01',
      :process_type_id => '1',
      :state => 'nuevo',
      :organizer_id => organizer_id
  	} )
end

Dado(/^existe una Organización: "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |name_entity, address, web, email|
  @organizer = Organizer.create!( { 
      :name => name_entity, 
      :address => address,
      :web => web,
      :email => email,
      :logo => nil,
      :user_id => 1
    } )
end

Dado(/^existe una Organización: "(.*?)", "(.*?)", "(.*?)" y "(.*?)" asociada al usuario "(.*?)".$/) do |name_entity, address, web, email, usuario|
    if usuario
      usuario = User.find_by_usuario("#{usuario}")
      user_id = usuario.id
    else
      user_id = 1
    end

    @organizer = Organizer.create!( { 
      :name => name_entity, 
      :address => address,
      :web => web,
      :email => email,
      :logo => nil,
      :user_id => user_id
    } )
end


Dado(/^existe un Usuario: "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |usuario, email, clave, tipo|
    @user = User.create!( { 
    :usuario => usuario, 
    :email => email,
    :password => clave,
    :password_confirmation => clave,
    :tipo_usuario_id => tipo
    } )

  #Para Devise podes probar con:
  #email = 'testing@man.net'
  #password = 'secretpass'
  #User.new(:email => email, :password => password, :password_confirmation => password).save!
end

Dado(/^existen (\d+) usuarios A y B$/) do |cantidad|
  @usuarioA = User.create!( { "usuario" => "usuario01" , "nombre" => "nombre" , "apellido" => "apellido" , "email" => "email@usuarioA.com" , "password" => "clave12345" , :password_confirmation => "clave12345" , "facebook" => "facebook" , "twitter" => "twitter" , "tipo_usuario_id" => 3 } )
  @usuarioB = User.create!( { "usuario" => "usuario02" , "nombre" => "nombre" , "apellido" => "apellido" , "email" => "email@usuarioB.com" , "password" => "clave12345" , :password_confirmation => "clave12345" , "facebook" => "facebook" , "twitter" => "twitter" , "tipo_usuario_id" => 3 } )
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
  #if button == "Guardar cambios"
   #puts("current_user: #{@selection_process.organizer.user_id}#")
   #puts("Weeeep!!!: #{current_user.id}#")
   #save_and_open_page 
  #end
  #click_button button #me da problemas con Capybara.
  #find_button(button).click #me da problemas con Capybara.
  click_on(button) # clicks on either links or buttons
  #save_and_open_page
end

Dado(/^que estoy en la pantalla de administración y hago click en "(.*?)"$/) do |botton|
  visit(paginas_admin_dashboard_path)
  click_on botton
end

Cuando(/^selecciono el link con el texto "(.*?)"$/) do |button|
  first("", :text => button) #Esto no hace click!
end

Dado(/^se lee el texto "(.*?)"$/) do |texto|
   page.should have_content(texto)
end

Dado(/^que estoy en la pantalla de "(.*?)"$/) do |pantalla|
    case pantalla
    when 'administración de Usuarios'
      visit('/users')
    when 'Administración de Organizaciones'
      visit('/organizers')
    when 'administración de procesos'
      visit('/selection_processes')
    when 'administración de Categorías'
      visit('/categories')
    when 'administración de Candidatos'
      visit('/candidates')
    when 'Modificar Organización'
      visit('/paginas/user_dashboard')
    when 'dashboard usuario'
      #Ojo User y SelecctionProcess tiene que estar definido.
      #puts(@user.inspect)
      visit("/paginas/user_dashboard/#{@user.id}")
    when 'Mis procesos'
      visit("/organizers/#{@user.id}/selection_processes")
    when 'Modificar Proceso'
      visit("/organizers/#{@user.id}/selection_processes")  
      #save_and_open_page
    when 'Modificar Mi Proceso'
      visit("/organizers/#{@user.id}/selection_processes/#{@selection_process.id}")  
      #save_and_open_page
    when 'Ingreso'
      visit(user_session_path)
    else
      visit('/¿A donde queres ir?')
    end
#Esto se puede refactorizar en el archivo: support/paths.rb
#when /la pagina de logueo/
#  user_session_path
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
  #save_and_open_page
  page.should have_content(mensaje)
end

#Login
Dado(/^que estoy logueado como "(.*?)"$/) do |tipo_usuario|
  #'Administrador'=> '1', 'Jurado'=> '2', 'Organizador'=> '3'
  case tipo_usuario
    when "Organizador"
     step %{existe un Usuario: "ONG shinjiikari", "shinji@ikari.com.ar", "neogenesis" y "3"}
     step %{existe una Organización: "Nerv Corp.", "Nueva nueva tokio", "" y "eva01@nerv.com" asociada al usuario "#{@user.usuario}".}
     #step %{que estoy en la pantalla de "dashboard usuario"}

    when "Jurado"
     step %{existe un Usuario: "Jurado shinjiikari", "shinji@ikari.com.ar", "neogenesis" y "2"}
    
    when "Administrador"
     step %{existe un Usuario: "Admin shinjiikari", "shinji@ikari.com.ar", "neogenesis" y "1"}
     #step %{existe una Organización: "Nerv Corp.", "Nueva nueva tokio", "" y "eva01@nerv.com" asociada al usuario "#{@user.usuario}".}

    else
      visit("/¿Quien sos?¡A donde queres ir!")
  end

  visit '/users/sign_out' #Sugieren cerrar la sesión por las dudas.
  #visit user_session_path
  visit '/users/sign_in'
  #Esto es para evitar el Ambiguous match
  fill_in("Correo electrónico", with: 'shinji@ikari.com.ar', :match => :prefer_exact)
  fill_in("Clave", with: 'neogenesis', :match => :prefer_exact)
  #save_and_open_page
  click_button "Iniciar sesión"
  
  @current_user = User.find_by_email('shinji@ikari.com.ar')
  #login_as(user, :scope => :user, :run_callbacks => false)
  page.should have_content("Ha iniciado sesión satisfactoriamente.")
end

#Casos extremos, errores y problemas.
Entonces(/^me muestra el mensaje de error que "([^"]*)"$/) do |mensaje|
  #save_and_open_page
  page.should have_content("error")
end

Dado(/^estoy logueado como, email: "(.*?)" y clave: "(.*?)"$/) do |usuario, clave|
  visit '/users/sign_out' #Sugieren cerrar la sesión por las dudas.
  visit '/users/sign_in'
  fill_in("Correo electrónico", with: "#{usuario}", :match => :prefer_exact)
  fill_in("Clave", with: "#{clave}", :match => :prefer_exact)
  click_button "Iniciar sesión"
  page.should have_content("Ha iniciado sesión satisfactoriamente.")
end
