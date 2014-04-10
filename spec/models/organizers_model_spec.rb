require 'spec_helper'

describe Organizer do 
    it "es invalido sin name, address o email" do
        organizer = Organizer.new
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