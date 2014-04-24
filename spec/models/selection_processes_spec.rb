require 'spec_helper'

describe SelectionProcesses do
    it "is invalid without name_process, place" do
        process = SelectionProcesses.new
        process.should_not be_valid
    end

    #@to-do
    it "Probar el controlador! las validaciones" do
    	pending "Falta probar las validaciones del modelo! este fue el primero que se hizo con scafolding"
    end
end
