# encoding: utf-8
require 'spec_helper'

describe OrganizersController do
  # This should return the minimal set of attributes required to create a valid
  # Organizer. As you add validations to Organizer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "ACME" , "address" => "UnaDireccionCualquiera"} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SelectionProcessController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new organizer as @organizer" do
      get :new, {}
      assigns(:organizer).should be_a_new(Organizer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Organizer" do
        expect {
          post :create, {:organizer => valid_attributes}, valid_session
        }.to change(Organizer, :count).by(1)
      end

      it "assigns a newly created organizer as @organizer" do
        post :create, {:organizer => valid_attributes}, valid_session
        assigns(:organizer).should_not be_nil
        assigns(:organizer).should be_a(Organizer)
        assigns(:organizer).should be_persisted
      end

      it "redirects to the created organizer" do
        post :create, {:organizer => valid_attributes}, valid_session
        response.should redirect_to(Organizer.last)
      end
    end
   end

   describe "GET index" do
      it "asigna todos los registros a @organizers" do
        organizers = Organizer.create! valid_attributes
        get :index, {}, valid_session
        assigns(:organizers).should eq([organizers])
      end
   end

   describe "DELETE Destroy" do
      it "borra el registro organizer solicitado" do
        organizer = Organizer.create! valid_attributes
        expect {
          delete :destroy, {:id => organizer.to_param}, valid_session
        }.to change(Organizer, :count).by(-1)      
      end
      it "redirecciona al index de organizer" do
        organizer = Organizer.create! valid_attributes
        delete :destroy, {:id => organizer.to_param}, valid_session
        response.should redirect_to(organizer_url)
      end
   end

end
