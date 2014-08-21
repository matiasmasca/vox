# encoding: utf-8
Dado(/^tengo mi usuario registrado$/) do
  step %{existe un Usuario: "shinjiikari", "shinji@ikari.com.ar", "neogenesis" y "1"}
end

Dado(/^completo mi email y contraseña$/) do
  visit '/users/sign_out'
  #step %{tengo mi usuario registrado}
  #visit user_session_path
  visit '/users/sign_in'
  #Esto es para evitar el Ambiguous match
  fill_in("Correo electrónico", with: "shinji@ikari.com.ar", :match => :prefer_exact)
  fill_in("Clave", with: "neogenesis", :match => :prefer_exact)
  #save_and_open_page
end
