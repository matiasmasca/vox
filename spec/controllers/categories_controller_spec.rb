# encoding: utf-8
require 'spec_helper'

describe CategoriesController do
  #Atributos validos minimos. (es decir datos obligatorios)
  let(:valid_attributes) { { "name" => "Mejor ACME" , "bench" => "5", "selection_process_id" => "1"}}
  #Sesión valida. Devolver los minimos atributos para que una sesión sea valida.
  let(:valid_session) { {} }

   describe "POST create" do
     describe "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, {:category => valid_attributes}, valid_session
        }.to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, {:category => valid_attributes}, valid_session
        assigns(:category).should_not be_nil
        assigns(:category).should be_a(Category)
        assigns(:category).should be_persisted
      end

      it "redirects to the created category" do
        post :create, {:category => valid_attributes}, valid_session
        response.should redirect_to(Category.last)
      end
     end
   end

    describe "with invalid params" do
      it "assigns the category as @category" do
        category = Category.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}, valid_session
        assigns(:category).should eq(category)
      end

      it "re-renders the 'edit' template" do
        category = Category.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        put :update, {:id => category.to_param, :category => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end

end