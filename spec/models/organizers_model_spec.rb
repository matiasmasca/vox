require 'spec_helper'

describe Organizer do 
    it "es invalido sin name, address o email" do
        organizer = Organizer.new
        organizer.should_not be_valid
    end

    it "es invalido, name debe ser mayor que 1" do
        organizer = Organizer.new({ "name" => "A" , "address" => "UnaDireccionCualquiera", "email" => "UnaDireccionCualquiera@test.com"})
        organizer.should_not be_valid
    end

    it "es invalido, address debe ser mayor que 8" do
        organizer = Organizer.new({ "name" => "ACME" , "address" => "UnaDire", "email" => "UnaDireccionCualquiera@test.com"})
        organizer.should_not be_valid
    end

    it "es invalido, email debe ser mayor que 8" do
        organizer = Organizer.new({ "name" => "ACME" , "address" => "UnaDireccionCualquiera", "email" => "me@g.ws"})
        organizer.should_not be_valid
    end

    it "es invalido, web debe ser mayor que 3" do
        organizer = Organizer.new({ "name" => "ACME", "address" => "UnaDireccionCualquiera", "email" => "UnaDireccionCualquiera@test.com", "web" => ".ws"})
        organizer.should_not be_valid
    end


    it "maximo es 250" do
       nombre = "A" * 251
       direccion = "A" * 251
       correo = "A" * 251
       web = "A" * 251
       
       organizer = Organizer.new({ "name" => nombre , "address" => "UnaDireccionCualquiera", "email" => "UnaDireccionCualquiera@test.com"})
       organizer.should_not be_valid

       organizer = Organizer.new({ "name" => "ACME" , "address" => direccion, "email" => "UnaDireccionCualquiera@test.com"})
       organizer.should_not be_valid

       organizer = Organizer.new({ "name" => "ACME" , "address" => "UnaDireccionCualquiera", "email" => correo})
       organizer.should_not be_valid

       organizer = Organizer.new({ "name" => "ACME" , "address" => "UnaDireccionCualquiera", "web" => web, "email" => "UnaDireccionCualquiera@test.com"})
       organizer.should_not be_valid


    end

	#deberia testear el Modelo.
	#it "Guarda el archivo que recibe" 
    #Que al recibir el archivo, lo ponga en su lugar y demás yerbas.
	# describe "POST create con foto" do
    #    before :each do
    #      @file = fixture_file_upload('images/uploads/isologos/no-borrar.jpg', 'image/jpg')
    #    end
    #    it "crear con logo de la organización" do
    #      post :upload, :upload => @file
    #      response.should be_success
    #    end
    #end
end