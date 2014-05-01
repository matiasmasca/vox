# encoding: utf-8
require 'spec_helper'

describe SelectionProcesses do
    it "es invalido sin nombre de proceso y lugar" do
        process = SelectionProcesses.new
        process.should_not be_valid
    end

    #@to-do
    it "Probar el controlador! las validaciones" do
    	pending "Falta probar las validaciones del modelo! este fue el primero que se hizo con scafolding"
    end
end
