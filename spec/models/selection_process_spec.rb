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
    #longitud de datos
    #validates :name_process, length: { in: 8..250, message: "debe ser entre 8 y 250 caracteres" }
    #validates :place, length: { in: 8..250, message: "debe ser entre 8 y 250 caracteres" }, :allow_blank => true

    #validates :duration, inclusion: { in: 1..365, message: "%{value} debe ser entre 1 y 365" }, :allow_blank => true, numericality: { only_integer: true }
    
    #datos unicos.
    #validates :name_process, uniqueness: { message: "ya está siendo utilizado.", :case_sensitive => false }
    end

    it "es invalido, nombre debe ser mayor que 7" do
        name_process = SelectionProcess.new({ "name_process" => "MyStrin" , "place" => "MyString", "organizer_id" => 1})
        name_process.should_not be_valid
    end

    it "debe estar asociado a una Organización" do
        organizer = Organizer.new({ "name" => "ACME" , "address" => "UnaDireccionCualquiera", "email" => "Una@test.com", "user_id" => 1 })
        selection_process = SelectionProcess.create!({  "name_process" => "MyString" , "place" => "MyString", "organizer_id" => organizer.id }) 
        #puts(selection_process.inspect) 
        organizer.should have_many(:selection_process)
        selection_process.should belong_to(:organizer)
    end
end
