# encoding: utf-8
require 'spec_helper'

describe "selection_processes/show" do
  before(:each) do
    @selection_process = assign(:selection_process, stub_model(SelectionProcess,
      :name_process => "Nombre del Proceso",
      :place => "Lugar",
      :duration => "Duración",
      :state => "Estado"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre del Proceso/)
    rendered.should match(/Lugar/)
    rendered.should match(/Duración/)
    rendered.should match(/Estado/)
  end
end
