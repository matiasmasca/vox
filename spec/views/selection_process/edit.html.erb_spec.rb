require 'spec_helper'

describe "selection_process/edit" do
  before(:each) do
    @selection_processes = assign(:selection_processes, stub_model(SelectionProcesses,
      :name_process => "Premios ACME",
      :place => "Los Angeles, CA, USA",
      :duration => "90",
      :state => "nuevo"
    ))
  end

  it "renders the edit selection_processes form" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", selection_processes_path(@selection_processes), "post" do
      assert_select "input#selection_processes_name_process[name=?]", "selection_processes[name_process]"
      assert_select "input#selection_processes_place[name=?]", "selection_processes[place]"
      assert_select "input#selection_processes_duration[name=?]", "selection_processes[duration]"
      #assert_select "input#selection_processes_state[name=?]", "selection_processes[state]"
      assert_select "select#selection_processes_state option[selected]", text: "nuevo"

    end
  end

  it "que se vean los Select Option"
end
