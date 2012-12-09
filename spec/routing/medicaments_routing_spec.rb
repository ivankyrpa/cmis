require "spec_helper"

describe MedicamentsController do
  describe "routing" do

    it "routes to #index" do
      get("/medicaments").should route_to("medicaments#index")
    end

    it "routes to #new" do
      get("/medicaments/new").should route_to("medicaments#new")
    end

    it "routes to #show" do
      get("/medicaments/1").should route_to("medicaments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/medicaments/1/edit").should route_to("medicaments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/medicaments").should route_to("medicaments#create")
    end

    it "routes to #update" do
      put("/medicaments/1").should route_to("medicaments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/medicaments/1").should route_to("medicaments#destroy", :id => "1")
    end

  end
end
