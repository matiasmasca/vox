#encoding: utf-8
Cuando(/^yo edito un Usuario$/) do
    click_on('Editar')
end

Cuando(/^cambio el nombre por "(.*?)", el correo electrónico por "(.*?)"$/) do |nombre, email|
  @update_user = nombre
  @update_email = email
  @user.update_attributes!({ :usuario => @update_user,:email => @update_email })

  if nombre
    fill_in "user_usuario", :with => nombre
  end

  if email
    fill_in "user_email", :with => email
  end

  click_on("Guardar cambios")

end

Entonces(/^veo que el nombre cambio y el correo electrónico cambio\.$/) do
 step %{que estoy en la pantalla de "administración de usuarios"}
 find("table#users-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(1)").should 	have_content(@update_name)
 find("table#users-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(4)").should	have_content(@update_email)

end

Dado(/^existe un Usuario llamado "(.*?)" con correo electrónico en "(.*?)", sin nombre y apellido definido$/) do |arg1, arg2|
  @user.update_attributes!({ :nombre => nil, :apellido => nil })
end

Cuando(/^cambio el nombre por "(.*?)" y el apellido por "(.*?)"$/) do |nombre, apellido|
  @update_name = nombre
  @update_apellido = apellido
  @user.update_attributes!({ :nombre => @update_name, :apellido => @update_apellido})
end

Entonces(/^veo que el nombre y apellido cambio, sin afectar a nombre de usuario o el correo electrónico\.$/) do
  step %{que estoy en la pantalla de "administración de usuarios"}
  find("table#users-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(2)").should have_content(@update_name)
  find("table#users-list > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)").should have_content(@update_apellido)         
end

Cuando(/^yo edito otro Usuario$/) do
  pending # express the regexp above with the code you wish you had
end

Cuando(/^modifico "(.*?)", "(.*?)", "(.*?)" y "(.*?)"$/) do |usuario, email, clave, tipo|
  if usuario
    fill_in "user_usuario", :with => usuario
  end

  if email
    fill_in "user_email", :with => email
  end

  if clave
    fill_in "user_clave", :with => clave
  end

  if tipo
    select tipo, :from => "Tipo Usuario"
  end

  click_on("Guardar cambios")
end

