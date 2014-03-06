require 'spec_helper'

describe "selection_process/show" do
  before(:each) do
    @selection_processes = assign(:selection_processes, stub_model(SelectionProcesses,
      :name_process => "Name Process",
      :place => "Place",
      :duration => "Duration",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Process/)
    rendered.should match(/Place/)
    rendered.should match(/Duration/)
    rendered.should match(/State/)
  end
end
