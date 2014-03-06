require 'spec_helper'

describe "selection_process/index" do
  before(:each) do
    assign(:selection_process, [
      stub_model(SelectionProcesses,
        :name_process => "Name Process",
        :place => "Place",
        :duration => "Duration",
        :state => "State"
      ),
      stub_model(SelectionProcesses,
        :name_process => "Name Process",
        :place => "Place",
        :duration => "Duration",
        :state => "State"
      )
    ])
  end

  it "renders a list of selection_process" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Process".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    assert_select "tr>td", :text => "Duration".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
