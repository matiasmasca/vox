# encoding: utf-8
require 'spec_helper'

describe CandidatesController do
	let(:valid_attributes) { { "name" => "Corre caminos" , "bios" => "UnaDireccionCualquiera", "category_id" => "1"} }
	let(:valid_session) { {} }

	describe "GET new" do
      it "assigns a new candidate as @candidate" do
      get :new, {}
      assigns(:candidate).should be_a_new(Candidate)
      end
    end

	describe "POST create" do
	  describe "with valid params" do
	      it "creates a new Candidate" do
	        expect {
	          post :create, {:candidate => valid_attributes}, valid_session
	        }.to change(Candidate, :count).by(1)
	      end

	      it "assigns a newly created candidate as @candidate" do
	        post :create, {:candidate => valid_attributes}, valid_session
	        assigns(:candidate).should_not be_nil
	        assigns(:candidate).should be_a(Candidate)
	        assigns(:candidate).should be_persisted
	      end

	      it "redirects to the created candidate" do
	        post :create, {:candidate => valid_attributes}, valid_session
	        response.should redirect_to(Candidate.last)
	      end
	 end

	  describe "POST create con foto" do
	       # before :each do
	       #   @file = fixture_file_upload('images/uploads/isologos/no-borrar.jpg', 'image/jpg')
	       # end
	       it "crear con logo de la organización" do
	       end
	  end
	end
end