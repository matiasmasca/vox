# encoding: utf-8
require 'spec_helper'

describe SelectionProcess do
    it "es invalido sin nombre de proceso y lugar" do
        process = SelectionProcess.new
        process.should_not be_valid
    end

    it "es invalido, name_process debe ser mayor que 7" do
        name_process = SelectionProcess.new({ "name_process" => "MyStrin" , "place" => "MyString", "organizer_id" => 1})
        name_process.should_not be_valid
    end

    it "es invalido, place debe ser mayor que 7" do
        place = SelectionProcess.new({ "name_process" => "MyString" , "place" => "MyStrin", "organizer_id" => 1})
        place.should_not be_valid
    end

    it "es invalido, duration debe estar entre 1 y 365" do
        place = SelectionProcess.new({ "name_process" => "MyString" , "place" => "MyString", "organizer_id" => 1, "duration" => 0})
        place.should_not be_valid

        place = SelectionProcess.new({ "name_process" => "MyString" , "place" => "MyString", "organizer_id" => 1, "duration" => 366})
        place.should_not be_valid
    end

   it "maximo para name_process y place es de 250" do
       name_process = "A" * 251
       place = "A" * 251

        name_process = SelectionProcess.new({ "name_process" => name_process , "place" => "MyString", "organizer_id" => 1})
        name_process.should_not be_valid

        place = SelectionProcess.new({ "name_process" => "MyString" , "place" => place, "organizer_id" => 1})
        place.should_not be_valid
    end

    it "name_process debe ser unico" do
      name_process = SelectionProcess.create!({"name_process" => "MyString" , "place" => "MyString", "organizer_id" => 1})
      name_process = SelectionProcess.new({"name_process" => "MyString" , "place" => "MyString", "organizer_id" => 1})
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
