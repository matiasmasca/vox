require 'spec_helper'

describe "selection_process/new" do
  before(:each) do
    assign(:selection_processes, stub_model(SelectionProcesses,
      :name_process => "Premios ACME",
      :place => "Los Angeles, CA, USA",
      :duration => "90",
      :state => "nuevo"
    ).as_new_record)
  end

  it "renders new selection_processes form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", selection_process_path, "post" do
      assert_select "input#selection_processes_name_process[name=?]", "selection_processes[name_process]"
      assert_select "input#selection_processes_place[name=?]", "selection_processes[place]"
      assert_select "input#selection_processes_duration[name=?]", "selection_processes[duration]"
      #assert_select "input#selection_processes_state[name=?]", "selection_processes[state]"
    end
  end
  
  it "que se vean los Select Option"
end
