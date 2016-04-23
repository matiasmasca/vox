# encoding: utf-8
require 'spec_helper'

describe Category do
  it 'es invalido sin name, address o email' do
        category = Category.new
        category.should_not be_valid
    end

    it 'es invalido con letras en bench o selection_process_id' do
      category = Category.new({ 'name' => 'Categoria'  , 'bench' => 'AAA' , 'selection_process_id' => 'AAA' })
        category.should_not be_valid
    end

    it 'es invalido si name es menor que 4 letras' do
      category = Category.new({ 'name' => 'Cate' , 'description' => 'Una cadena' , 'bench' => '5' , 'selection_process_id' => '1' })
        category.should_not be_valid
    end
    
    it 'es invalido si description tiene contenido menor que 4 letras' do
      category = Category.new({ 'name' => 'Categoria' , 'description' => 'Desc' , 'bench' => '5' , 'selection_process_id' => '1' })
        category.should_not be_valid        
    end

    it 'es invalido si bench es menor que 1' do
      category = Category.new({ 'name' => 'Categoria' , 'description' => 'Una descripción' , 'bench' => '0' , 'selection_process_id' => '1' })
        category.should_not be_valid 
    end

    it 'el maximo es 250 para nombre, 999 para bench y 19 digitos para el id.' do
       nombre = 'A' * 251
       bench = 9999
       proceso_id = 1_000_000_000_000_000_000_000
       
       category = Category.new({ 'name' => nombre , 'description' => 'Una descripción' , 'bench' => '1' , 'selection_process_id' => '1' })
       category.should_not be_valid

       category = Category.new({ 'name' => 'Categoria' , 'description' => 'Una descripción' , 'bench' => bench , 'selection_process_id' => '1' })
       category.should_not be_valid

       category = Category.new({ 'name' => 'Categoria' , 'description' => 'Una descripción' , 'bench' => '1' , 'selection_process_id' => proceso_id })
       category.should_not be_valid
    end

    it 'nombre debe ser unico, dentro del proceso' do
      category = Category.create!({ 'name' => 'Categoria' , 'description' => 'Una descripción' , 'bench' => '5' , 'selection_process_id' => '1' })
      category = Category.new({ 'name' => 'Categoria' , 'description' => 'Una descripción' , 'bench' => '5' , 'selection_process_id' => '1' })
      category.should_not be_valid
    end

    it 'tiene asignado una selection_process_id' do
      selection_process = SelectionProcess.create!({ 'name_process' => 'MyString' , 'place' => 'MyString', 'organizer_id' => 1 }) 
      category = Category.new({ 'name' => 'Categoria' , 'description' => 'Una descripción' , 'bench' => '5' , 'selection_process_id' => selection_process.id })
      selection_process.should have_many(:category)
      category.should belong_to(:selection_process)
    end
end