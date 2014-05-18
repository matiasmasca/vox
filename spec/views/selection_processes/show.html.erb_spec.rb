# encoding: utf-8
require 'spec_helper'

describe "selection_processes/show" do
  before(:each) do
    @organizer = assign(:organizer, stub_model(Organizer,
      :id => 1,
      :name => "ACME" , 
      :address => "UnaDireccionCualquiera", 
      :web => "me.ar", 
      :email => "UnaDireccionCualquiera@test.com"
    ))
    @selection_process = assign(:selection_process, stub_model(SelectionProcess,
      :name_process => "Nombre del Proceso",
      :place => "Lugar",
      :duration => "Duración",
      :state => "Estado",
      :organizer_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre del Proceso/)
    rendered.should match(/Lugar/)
    rendered.should match(/Duración/)
    rendered.should match(/Estado/)

    #TO-DO: y el stub??

    #Me tiene que mostrar la info. basica del organizador y un link a más info.
    #expect(page).to have_content(@selection_process.organizer.name)
    #expect(page).to have_content("más información")
    rendered.should match(/Organiza/)
    rendered.should match(/más información/)
  end
end


# Podes usar stub_chain, para simular: selection_process.organizer
# Ejmplo:
# @user = current_site.users.new
# u = mock("User")
# controller.stub_chain(:current_site, :users, :new).and_return(u)
# assigns[:user].should == u