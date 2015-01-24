# encoding: utf-8
require 'spec_helper'

describe Candidate do
  it 'es invalido sin nombre' do
	  candidate = Candidate.new
      candidate.should_not be_valid
  end

  describe 'longitudes minimas:' do 
     it 'es invalido si name es menor que 2 letras' do
      candidate = Candidate.new( { 'name' => 'N' , 'bios' => 'AAA' , 'category_id' => '1' } )
      candidate.should_not be_valid
     end

     it 'es invalido si bios es menor que 5 letras' do
      candidate = Candidate.new( { 'name' => 'Nombre' , 'bios' => 'AAAA' , 'category_id' => '1' } )
      candidate.should_not be_valid
     end
     it 'es valido si bios esta vacio' do
      candidate = Candidate.new( { 'name' => 'Nombre' , 'category_id' => '1' } )
      candidate.should be_valid
     end
  end

  describe 'longitudes maximas' do
  # s/ PO longitudes máximas
  #- id 1 int, solo numeros. (16 digitos maximo)
  #- name: 110 (varchar)
  #- bios: sin limite. [En postgresql es posible no tener limites en text ]
  #- category_id: numero 16 digitos.
    it 'es invalido, si name es mayor que 110' do
      nombre = 'A' * 111
      candidate = Candidate.new( { 'name' => nombre , 'bios' => 'la bios del tipo' , 'category_id' => '1' } )
      candidate.should_not be_valid
    end

    it 'es invalido, si category_id es mayor que 19' do
      category_id = 1_000_000_000_000_000_000_000
      candidate = Candidate.new( { 'name' => 'Nombre' , 'bios' => 'la bios del tipo' , 'category_id' => category_id } )
      candidate.should_not be_valid
    end
  end

  it 'nombre debe ser unico, dentro de la categoria' do
    candidate = Candidate.create!( { 'name' => 'peperoni' , 'bios' => 'la bios del tipo' , 'category_id' => '1'} )
    candidate = Candidate.new( { 'name' => 'peperoni' , 'bios' => 'la bios del tipo' , 'category_id' => '1'} )
    candidate.should_not be_valid
  end

  it 'tiene asignado una category_id' do
    category = Category.create!( { 'name' => 'La gran categoria' , 'description' => 'Una descripción' , 'bench' => '1' , 'selection_process_id' => '1'} ) 
    candidate = Candidate.new( {  'name' => 'Pepe Argento' , 'bios' => 'la bios del tipo' , 'category_id' => category.id} )
    category.should have_many(:candidate)
    candidate.should belong_to(:category)
    #candidate.should have_and_belong_to_many(:categories)
    # esto se hace distinto porque es una colección.
  end
  
  #@to-do
  it 'Guarda el archivo que recibe' 
    #Que al recibir el archivo, lo ponga en su lugar y demás yerbas.
	  # describe 'POST create con foto' do
    #    before :each do
    #      @file = fixture_file_upload('images/uploads/isologos/no-borrar.jpg', 'image/jpg')
    #    end
    #    it 'crear con logo de la organización' do
    #      ...
    #      response.should be_success
    #    end
    #end

  # it 'nueva imagen tiene extensión distinta'
  	# si la foto tiene una extensión distinta, entonces hay que borrar la que tiene la vieja extensión, porque en este caso no pisa el archivo . 
  # end
end