require "spec_helper"

describe SelectionProcessController do
  describe "routing" do

    it "routes to #index" do
      get("/selection_process").should route_to("selection_process#index")
    end

    it "routes to #new" do
      get("/selection_process/new").should route_to("selection_process#new")
    end

    it "routes to #show" do
      get("/selection_process/1").should route_to("selection_process#show", :id => "1")
    end

    it "routes to #edit" do
      get("/selection_process/1/edit").should route_to("selection_process#edit", :id => "1")
    end

    it "routes to #create" do
      post("/selection_process").should route_to("selection_process#create")
    end

    it "routes to #update" do
      put("/selection_process/1").should route_to("selection_process#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/selection_process/1").should route_to("selection_process#destroy", :id => "1")
    end

  end
end
