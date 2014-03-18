# encoding: utf-8
#Crear la entidad: Nombre, Dirección, Sitio Web, email, logo.
#"ABSTRACT", Av. 9 de Julio Nro. 220, www.abstract.org.ar, /organizadores/logos/logoXXX.jpg
Dado(/^que estoy en la pantalla de administración y hago click en "(.*?)"$/) do |boton|
  visit("/user/home")
  click_on boton
end

Dado(/^completo los datos de la organización: Nombre, Dirección, Sitio Web, email$/) do
  pending # express the regexp above with the code you wish you had
end

Dado(/^subo una imagen que se utilizará como logo de la organización\.$/) do
  pending # express the regexp above with the code you wish you had
end

Entonces(/^se crea la organización y me muestra el mensaje "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Entonces(/^me muestra los datos recien creados junto a la imagen$/) do
  pending # express the regexp above with the code you wish you had
end

