# encoding: utf-8
require 'spec_helper'

describe CandidatesController do
    login_admin
    
    let(:valid_attributes) { {  "name" => "Corre caminos" , "bios" => "UnaDireccionCualquiera" , "category_id" => "1" }  }
    let(:valid_session) { { "warden.user.user.key" => session["warden.user.user.key"] } }
 
    # Crear Proceso y Category
    before :each do     
        selection_process = SelectionProcess.create! ({ "name_process" => "MyString" , "place" => "MyString" , "organizer_id" => "1" })
        category = Category.create! ({  "name" => "Mejor ACME" , "bench" => "5" , "selection_process_id" => "1" })
    end

    describe "GET new" do
      it "assigns a new candidate as @candidate" do
        get :new , { }
        assigns(:candidate).should be_a_new(Candidate)
      end
    end

    describe "POST create" do
      describe "with valid params" do
          it "creates a new Candidate" do
            expect { 
               post :create , { :candidate => valid_attributes } , valid_session
             }.to change(Candidate , :count).by(1)
          end

          it "assigns a newly created candidate as @candidate" do
            post :create , { :candidate => valid_attributes } , valid_session
            assigns(:candidate).should_not be_nil
            assigns(:candidate).should be_a(Candidate)
            assigns(:candidate).should be_persisted
          end

          it "redirects to the created candidate" do
            post :create , { :candidate => valid_attributes } , valid_session
            response.should redirect_to(Candidate.last)
          end
      end
    end

      describe "GET index" do
         it "asigna todos los registros a @candidates" do
            candidates = Candidate.create! valid_attributes
            get :index , {  } , valid_session
            assigns(:candidates).should eq([candidates])
         end
      end

      describe "DELETE Destroy" do
        before(:each) do
          request.env["HTTP_REFERER"] = "/candidates"
        end
         it "borra el registro category solicitado" do
            candidate = Candidate.create! valid_attributes
            expect { 
              delete :destroy , { :id => candidate.to_param } , valid_session
             }.to change(Candidate , :count).by(-1)      
         end
         it "redirecciona al index de candidate" do
           candidate = Candidate.create! valid_attributes
           delete :destroy , { :id => candidate.to_param } , valid_session
           response.should redirect_to(candidates_url)
         end
      end

    describe "GED Edit" do
       it "guardar los cambios que recibe sobre una Organización." do
         candidate = Candidate.create! valid_attributes
         get :edit , { :id => candidate.to_param } , valid_session
         assigns(:candidate).should eq(candidate)
      end
    end

    describe "PUT update" do
        describe "with valid params" do
          it "updates the requested candidate" do
            candidate = Candidate.create! valid_attributes
            # Assuming there are no other cateogry in the database , this
            # specifies that the Candidate created on the previous line
            # receives the :update_attributes message with whatever params are
            # submitted in the request.
            Candidate.any_instance.should_receive(:update).with({  "name" => "MyString" , "bios" => "MyString"  })
            put :update , { :id => candidate.to_param , :candidate => {  "name" => "MyString" , "bios" => "MyString"  } } , valid_session
          end

          it "assigns the requested candidate as @candidate" do
            candidate = Candidate.create! valid_attributes
            put :update , { :id => candidate.to_param , :candidate => valid_attributes } , valid_session
            assigns(:candidate).should eq(candidate)
          end

          it "redirects to the candidate" do
            candidate = Candidate.create! valid_attributes
            put :update , { :id => candidate.to_param , :candidate => valid_attributes } , valid_session
            response.should redirect_to(candidate)
          end
        end

        describe "with invalid params" do
          it "assigns the candidate as @candidate" do
            candidate = Candidate.create! valid_attributes
            # Trigger the behavior that occurs when invalid params are submitted
            Candidate.any_instance.stub(:save).and_return(false)
            put :update , { :id => candidate.to_param , :candidate => { "name" => "invalid value" } } , valid_session
            assigns(:candidate).should eq(candidate)
          end

          it "re-renders the 'edit' template" do
            candidate = Candidate.create! valid_attributes
            # Trigger the behavior that occurs when invalid params are submitted
            Candidate.any_instance.stub(:save).and_return(false)
            put :update , { :id => candidate.to_param , :candidate => { "name" => "invalid value" } } , valid_session
            response.should render_template("edit")
          end
        end
    end
end