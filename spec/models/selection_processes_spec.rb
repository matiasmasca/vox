require 'spec_helper'

describe SelectionProcesses do
      it "is invalid without name_process, place" do
        process = SelectionProcesses.new
        process.should_not be_valid
    end
end
