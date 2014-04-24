require 'spec_helper'

describe User do
    #Camino feliz
	it "es valido, con todos los datos" do
		user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
		user.should be_valid
	end

	#Casos extremos.
	#Cuales son obligatorios? el PO, dijo que son: usuario, email, clave, tipo_usuario_id. 
    it "es invalido sin name, address o email" do
        user = User.new
        user.should_not be_valid
    end

  	#Cuales son las longitudes minimas y maximas? el PO, dijo que:
  	#- usuario: 8 chr ~ 110
  	#- nombre: 2 chr ~ 110, allow blank
  	#- apellido: 2 chr ~ 110, allow blank
  	#- email: 5 chr ~ 110
  	#- clave: 9 chr ~ 110
  	#- facebook: 2 chr ~ 110, allow blank
  	#- twiter: 2 chr ~ 15, allow blank (incluido el arroba)
  	#- tipo_usuario_id: 1 (por ahora solo habrá 3 tipos de usuarios: 1,2,3)
    it "es invalido, usuario debe ser mayor que 8" do
        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
        user.should_not be_valid
    end

  	it "es invalido, nombre debe ser mayor que 2" do
        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "M" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
        user.should_not be_valid
    end

  	it "es invalido, apellido debe ser mayor que 2" do
        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "M" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
        user.should_not be_valid
    end

  	it "es invalido, email debe ser mayor que 5" do
        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "M@.c", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
        user.should_not be_valid
    end

  	it "es invalido, clave debe ser mayor que 5" do
        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@correo.com", "clave" => "MiClaveE" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
        user.should_not be_valid
    end

  	it "es invalido, facebook debe ser mayor que 2" do
        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@correo.com", "clave" => "MiClaveEs123" ,"facebook" => "F" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
        user.should_not be_valid
    end

  	it "es invalido, twitter debe ser mayor que 5" do
        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@correo.com", "clave" => "MiClaveEs123" ,"facebook" => "FacebookUser" ,"twitter" => "@" ,"tipo_usuario_id" => 3 })
        user.should_not be_valid
    end

  	it "es invalido, tipo_usuario_id debe ser 1, 2 o 3" do
        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@correo.com", "clave" => "MiClaveEs123" ,"facebook" => "FacebookUser" ,"twitter" => "@M" ,"tipo_usuario_id" => 0 })
        user.should_not be_valid

        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@correo.com", "clave" => "MiClaveEs123" ,"facebook" => "FacebookUser" ,"twitter" => "@M" ,"tipo_usuario_id" => 4 })
        user.should_not be_valid

        user = User.new({ "usuario" => "MyStrin" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@correo.com", "clave" => "MiClaveEs123" ,"facebook" => "FacebookUser" ,"twitter" => "@M" ,"tipo_usuario_id" => "1" })
        user.should_not be_valid
    end

    it "maximo es 250" do
       usuario = "A" * 111
       nombre= "A" * 111
       apellido= "A" * 111
       email= "A" * 111
       clave= "A" * 111
       facebook= "A" * 111
       twitter= "A" * 16
       tipo_usuario_id = 10

       user = User.new({ "usuario" => usuario ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
       user.should_not be_valid

       user = User.new({ "usuario" => "MyString" ,"nombre" => nombre ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
       user.should_not be_valid

       user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => apellido ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
       user.should_not be_valid

       user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => email, "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
       user.should_not be_valid

       user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => clave ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
       user.should_not be_valid

       user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => facebook ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
       user.should_not be_valid

       user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => twitter ,"tipo_usuario_id" => 3 })
       user.should_not be_valid

       user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => tipo_usuario_id })
       user.should_not be_valid
    end

    it "usuario debe ser unico" do
      user = User.create!({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
      user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
      user.should_not be_valid
    end

    it "email debe ser unico" do
      user = User.create!({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
      user = User.new({ "usuario" => "MyString" ,"nombre" => "MyString" ,"apellido" => "MyString" ,"email" => "MyString@MyString.com", "clave" => "MiClaveEs123" ,"facebook" => "MyString" ,"twitter" => "@MyString" ,"tipo_usuario_id" => 3 })
      user.should_not be_valid
    end
end
