require 'spec_helper'

describe "SelectionProcesses" do
  describe "GET /selection_process" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get selection_process_path
      response.status.should be(200)
    end
  end
end
