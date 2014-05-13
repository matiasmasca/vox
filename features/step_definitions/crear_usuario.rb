# encoding: utf-8
Dado(/^completo los datos del usuario con "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do | usuario, nombre, apellido, email, clave, facebook, twitter, tipo |
  fill_in "user_usuario", :with => usuario
  fill_in "user_nombre", :with => nombre
  fill_in "user_apellido", :with => apellido
  fill_in "user_email", :with => email
  fill_in "user_clave", :with => clave
  fill_in "user_facebook", :with => facebook
  fill_in "user_twitter", :with => twitter
  # Select tipo 1.  
  select tipo, :from => "Tipo Usuario"
 
  #Crear mock
  @Usuario = {"usuario" => usuario,"nombre" => nombre,"apellido" => apellido, "email" => email, "clave" => clave, "facebook" => facebook, "twitter" => twitter, "tipo_usuario_id" => tipo}  
end

Dado(/^como ya existe un usuario con ese "(.*?)"$/) do |arg1|
  if arg1 == "correo electrónico" 
   #Crear registro en la db
   @Usuario = User.new({"usuario" => "usuario01","nombre" => "nombre","apellido" => "apellido", "email" => "email", "clave" => "clave1234", "facebook" => "facebook", "twitter" => "twitter", "tipo_usuario_id" => 3 }) 
  end

  if arg1 == "nombre de usuairo"
   #Crear registro en la db
   @Usuario = User.new({"usuario" => "usuario01","nombre" => "nombre","apellido" => "apellido", "email" => "email", "clave" => "clave1234", "facebook" => "facebook", "twitter" => "twitter", "tipo_usuario_id" => 3})   end
end

