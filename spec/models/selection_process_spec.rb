# encoding: utf-8
require 'spec_helper'

describe SelectionProcess do
    it "es invalido sin nombre de proceso y lugar" do
        process = SelectionProcess.new
        process.should_not be_valid
    end

    #@to-do
    it "Probar el controlador! las validaciones" do
    	pending "Falta probar las validaciones del modelo! este fue el primero que se hizo con scafolding"
    end

    it "debe estar asociado a una Organización" do
        organizer = Organizer.new({ "name" => "ACME" , "address" => "UnaDireccionCualquiera", "email" => "Una@test.com", "user_id" => 1 })
        selection_process = SelectionProcess.create!({  "name_process" => "MyString" , "place" => "MyString", "organizer_id" => organizer.id }) 
        #puts(selection_process.inspect) 
        organizer.should have_many(:selection_process)
        selection_process.should belong_to(:organizer)
    end
end
