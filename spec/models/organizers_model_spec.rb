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

    it "maximo es 250"

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