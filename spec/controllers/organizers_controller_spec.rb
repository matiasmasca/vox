# encoding: utf-8
require 'spec_helper'

describe OrganizersController do
  # This should return the minimal set of attributes required to create a valid
  # Organizer. As you add validations to Organizer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "ACME" , "address" => "UnaDireccionCualquiera", "email" => "UnaDireccionCualquiera@test.com"} }

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

    describe "POST create con foto" do
        before :each do
          @file = fixture_file_upload('images/uploads/isologos/no-borrar.jpg', 'image/jpg')
        end
        it "crear con logo de la organización" do
          post :upload, :upload => @file
          response.should be_success
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
        response.should redirect_to(organizers_url)
      end
  end

  describe "GED Edit" do
      it "guardar los cambios que recibe sobre una Organización." do
        organizer = Organizer.create! valid_attributes
        get :edit, {:id => organizer.to_param}, valid_session
        assigns(:organizer).should eq(organizer)
      end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested organizer" do
        organizer = Organizer.create! valid_attributes
        # Assuming there are no other selection_process in the database, this
        # specifies that the Organizer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Organizer.any_instance.should_receive(:update).with({ "name" => "MyString", "address" => "MyString" })
        put :update, {:id => organizer.to_param, :organizer => { "name" => "MyString", "address" => "MyString" }}, valid_session
      end

      it "assigns the requested organizer as @organizer" do
        organizer = Organizer.create! valid_attributes
        put :update, {:id => organizer.to_param, :organizer => valid_attributes}, valid_session
        assigns(:organizer).should eq(organizer)
      end

      it "redirects to the organizer" do
        organizer = Organizer.create! valid_attributes
        put :update, {:id => organizer.to_param, :organizer => valid_attributes}, valid_session
        response.should redirect_to(organizer)
      end
    end

    describe "with invalid params" do
      it "assigns the organizer as @organizer" do
        organizer = Organizer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Organizer.any_instance.stub(:save).and_return(false)
        put :update, {:id => organizer.to_param, :organizer => { "name_process" => "invalid value" }}, valid_session
        assigns(:organizer).should eq(organizer)
      end

      it "re-renders the 'edit' template" do
        organizer = Organizer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Organizer.any_instance.stub(:save).and_return(false)
        put :update, {:id => organizer.to_param, :organizer => { "name_process" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end

    end
  end

end