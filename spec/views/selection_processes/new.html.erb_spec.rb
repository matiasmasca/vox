require 'spec_helper'

describe "selection_processes/new" do
  before(:each) do
    assign(:selection_process, stub_model(SelectionProcess,
      :name_process => "Premios ACME",
      :place => "Los Angeles, CA, USA",
      :duration => "90",
      :state => "nuevo"
    ).as_new_record)
  end

  it "renders new selection process form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", selection_processes_path, "post" do
      assert_select "input#selection_process_name_process[name=?]", "selection_process[name_process]"
      assert_select "input#selection_process_place[name=?]", "selection_process[place]"
      assert_select "input#selection_process_duration[name=?]", "selection_process[duration]"
      #assert_select "input#selection_process_state[name=?]", "selection_processes[state]"
      assert_select "select#selection_process_state option[selected]", text: "nuevo"
    end
  end
  
  it "que se vean los Select Option" do
    pending "falta probar los Select Option"
  end
end
