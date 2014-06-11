# encoding: utf-8
require 'spec_helper'

describe Category do
	it "es invalido sin name, address o email" do
        category = Category.new
        category.should_not be_valid
    end

    it "es invalido con letras en bench o selection_process_id" do
	    category = Category.new({ "name" => "Categoria" , "bench" => "AAA", "selection_process_id" => "AAA"})
        category.should_not be_valid
    end

    it "es invalido si name es menor que 4 letras" do
    	category = Category.new({ "name" => "Cate" ,"description" => "Una cadena", "bench" => "5", "selection_process_id" => "1"})
        category.should_not be_valid
    end
    
    it "es invalido si description tiene contenido menor que 4 letras" do
    	category = Category.new({ "name" => "Categoria" ,"description" => "Desc", "bench" => "5", "selection_process_id" => "1"})
        category.should_not be_valid    		
    end

    it "es invalido si bench es menor que 1" do
    	category = Category.new({ "name" => "Categoria" ,"description" => "Una descripción", "bench" => "0", "selection_process_id" => "1"})
        category.should_not be_valid 
    end

end

