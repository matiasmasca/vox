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

Dado(/^subo una imagen que se utilizará como "(.*?)"\.$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Entonces(/^se crea el usuario y me muestra el mensaje "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Entonces(/^me muestra la imagen de "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
