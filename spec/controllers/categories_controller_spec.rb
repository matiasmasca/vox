# encoding: utf-8
require 'spec_helper'

describe CategoriesController do
  login_admin
  
  #Atributos validos minimos. (es decir datos obligatorios)
  let(:valid_attributes) { { "name" => "Mejor ACME" , "bench" => "5", "selection_process_id" => "1" } }
  #Sesión valida. Devolver los minimos atributos para que una sesión sea valida.
  let(:valid_session) { {} }

  describe "POST create" do
     describe "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, { :category => valid_attributes }, valid_session
        }.to change(Category, :count).by(1)
      end

      it "assigns a newly created category as @category" do
        post :create, { :category => valid_attributes }, valid_session
        assigns(:category).should_not be_nil
        assigns(:category).should be_a(Category)
        assigns(:category).should be_persisted
      end

      it "redirects to the created category" do
        post :create, { :category => valid_attributes }, valid_session
        response.should redirect_to(Category.last)
      end
     end
  end

  describe "GET index" do
     it "asigna todos los registros a @categories" do
        categories = Category.create! valid_attributes
        get :index, { }, valid_session
        assigns(:categories).should eq([categories])
     end
  end

  describe "DELETE Destroy" do
    before(:each) do
      request.env["HTTP_REFERER"] = "/categories"
    end
    
     it "borra el registro category solicitado" do
        category = Category.create! valid_attributes
        expect {
          delete :destroy, { :id => category.to_param }, valid_session
        }.to change(Category, :count).by(-1)      
     end
     it "redirecciona al index de category" do
       category = Category.create! valid_attributes
       delete :destroy, { :id => category.to_param }, valid_session
       response.should redirect_to(categories_url)
     end
  end

  describe "GED Edit" do
     it "guardar los cambios que recibe sobre una Organización." do
        category = Category.create! valid_attributes
        get :edit, { :id => category.to_param }, valid_session
        assigns(:category).should eq(category)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested category" do
        category = Category.create! valid_attributes
        # Assuming there are no other cateogry in the database, this
        # specifies that the Category created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Category.any_instance.should_receive(:update).with( { "name" => "MyString" , "description" => "MyString" } )
        put :update, { :id => category.to_param , :category => { "name" => "MyString" , "description" => "MyString" } } , valid_session
      end

      it "assigns the requested category as @category" do
        category = Category.create! valid_attributes
        put :update , { :id => category.to_param , :category => valid_attributes } , valid_session
        assigns(:category).should eq(category)
      end

      it "redirects to the category" do
        category = Category.create! valid_attributes
        put :update , { :id => category.to_param , :category => valid_attributes } , valid_session
        response.should redirect_to(category)
      end
    end

    describe "with invalid params" do
      it "assigns the category as @category" do
        category = Category.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        put :update , { :id => category.to_param , :category => { "name" => "invalid value" } } , valid_session
        assigns(:category).should eq(category)
      end

      it "re-renders the 'edit' template" do
        category = Category.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Category.any_instance.stub(:save).and_return(false)
        put :update , { :id => category.to_param , :category => { "name" => "invalid value" } } , valid_session
        response.should render_template("edit")
      end
    end
  end
end