# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = [{:usuario => 'Aladdin12', :nombre => 'Gregorio', :apellido => 'Martinez', :email => 'unemail@go.com', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
    	  {:usuario => 'TheTerminator', :nombre => 'Ramon', :apellido => 'Ortega', :email => 'beto@ortega.com', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
    	  {:usuario => 'HarrySally', :nombre => 'Ramon', :apellido => 'Don', :email => 'donramon@chavo.mx', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
    	  {:usuario => 'TheHelp12', :nombre => 'Gregorio', :apellido => 'Torres', :email => 'dostorres@hobbit.com', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
     	  {:usuario => 'Chocolate', :nombre => 'Gregorio', :apellido => 'Kaute-Mock', :email => 'examples@itaca.mx', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
     	  {:usuario => 'Amelie123', :nombre => 'Ramon', :apellido => 'Izidor', :email => 'unemail1@go.com', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
     	  {:usuario => 'SpaceOdyssey', :nombre => 'Gregorio', :apellido => 'Delmonte', :email => 'unemail2@go.com', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
     	  {:usuario => 'TheIncredibles', :nombre => 'Gregorio', :apellido => 'Perez', :email => 'unemail3@go.com', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
     	  {:usuario => 'RaidersLostArk', :nombre => 'Gregorio', :apellido => 'Acuña', :email => 'unemail4@go.com', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'},
     	  {:usuario => 'ChickenRun', :nombre => 'Gregorio', :apellido => 'Escaleno', :email => 'unemail5@go.com', :clave => 'clave12345', :facebook => 'https://facebook.com/cosme.fulanito', :twitter => '@fulanito', :tipo_usuario_id => '3'}
  	 ]

users.each do |user|
  User.create!(user)
end

organizers = [{:name => 'ACME', :address => 'Desierto de Arizona', :web => 'http://www.acme.org', :email => 'contact@acme.org', :logo => 'jpg', :user_id => 1 },
  {:name => 'FAMPAS (Fake Academy of Motion Picture Arts and Sciences)', :address => '8949 Wilshire Boulevard Beverly Hills, California 90211', :web => 'http://www.fakeoscars.org/', :email => 'fakecontact@oscars.org', :logo => 'jpg',:user_id => 1},
  {:name => 'test13245', :address => 'Dirección de la ORG', :web => 'http://test.com', :email => 'contact@oscars.org', :logo => 'jpg',:user_id => 1},
  {:name => 'Comunidad TIC', :address => 'Corrientes, Argentina', :web => 'http://www.comunidadtic.com.ar', :email => 'contacto@comunidadtic.com.ar', :logo => 'jpg',:user_id => 1},
  {:name => 'Nombre A', :address => 'Una dirección cualquiera', :web => 'UnSitioWeb', :email => 'examplesA@mail.ws',:user_id => 1},
  {:name => 'Nombre B', :address => 'Una dirección cualquiera', :web => 'UnSitioWeb', :email => 'examplesB@mail.ws',:user_id => 1},
  {:name => 'Nombre C', :address => 'Una dirección cualquiera', :web => 'UnSitioWeb', :email => 'examplesC@mail.ws',:user_id => 1},
  {:name => 'Nombre D', :address => 'Una dirección cualquiera', :web => 'UnSitioWeb', :email => 'examplesD@mail.ws',:user_id => 1},
  {:name => 'Nombre E', :address => 'Una dirección cualquiera', :web => 'UnSitioWeb', :email => 'examplesE@mail.ws',:user_id => 1},
  {:name => 'Nombre F', :address => 'Una dirección cualquiera', :web => 'UnSitioWeb', :email => 'examplesF@mail.ws',:user_id => 1}
  	 ]

organizers.each do |organizer|
  Organizer.create!(organizer)
end

selection_processes = [{:name_process => 'ACME Prize', :place => 'Desierto de Arizona', :duration => '180', start_date: "2014-03-13", end_date: "2014-12-13", state: "nuevo", :process_type_id => 1 },
  {:name_process => 'Fake Oscar 2014', :place => '8949 Wilshire Boulevard Beverly Hills, California 90211', :duration => '180', start_date: "2014-03-13", end_date: "2014-12-13", state: "nuevo", :process_type_id => 1},
  {:name_process => 'Grammy 2014', :place => 'Av. Siempre Viva 742', :duration => '180', start_date: "2014-03-13", end_date: "2014-12-13", state: "nuevo", :process_type_id => 1},
  {:name_process => 'Premios TIC', :place => 'Corrientes, Argentina', :duration => '180', start_date: "2014-03-13", end_date: "2014-12-13", state: "nuevo", :process_type_id => 1},
  {:name_process => 'Miss Multiverso 2014', :place => 'Los Angeles, CA, USA', :duration => '364', start_date: "2014-03-13", end_date: "2014-12-13", state: "nuevo", :process_type_id => 2},
  {:name_process => 'Nombre B', :place => 'Una dirección cualquiera', :duration => '180', start_date: "2014-03-13", end_date: "2014-12-13", state: "nuevo", :process_type_id => 1},
  {:name_process => 'Nombre F', :place => 'Una dirección cualquiera', :duration => '180', start_date: "2014-03-13", end_date: "2014-12-13", state: "nuevo", :process_type_id => 1}
  	 ]

selection_processes.each do |process|
  SelectionProcesses.create!(process)
end

