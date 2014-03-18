# encoding: utf-8
require 'spec_helper'

describe "selection_process/index" do
  before(:each) do
    assign(:selection_process, [
      stub_model(SelectionProcesses,
        :name_process => "Premio ACME",
        :place => "Los Angeles, CA, USA",
        :duration => "180",
        :state => "nuevo"
      ),
      stub_model(SelectionProcesses,
        :name_process => "Premio ACME",
        :place => "Los Angeles, CA, USA",
        :duration => "180",
        :state => "nuevo"
      )
    ])
  end

  it "renders a list of selection_process" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Premio ACME".to_s, :count => 2
    assert_select "tr>td", :text => "Los Angeles, CA, USA".to_s, :count => 2
    assert_select "tr>td", :text => "180".to_s, :count => 2
    assert_select "tr>td", :text => "nuevo".to_s, :count => 2
  end
end
