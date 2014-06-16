# encoding: utf-8
require 'spec_helper'

describe Candidate do
  it "es invalido sin nombre" do
	  candidate = Candidate.new
      candidate.should_not be_valid
  end

  it "longitudes minimas"
  it "longitudes maximas"
  
end