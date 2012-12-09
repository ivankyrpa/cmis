require "spec_helper"

describe SymptomsController do
  describe "routing" do

    it "routes to #index" do
      get("/symptoms").should route_to("symptoms#index")
    end

    it "routes to #new" do
      get("/symptoms/new").should route_to("symptoms#new")
    end

    it "routes to #show" do
      get("/symptoms/1").should route_to("symptoms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/symptoms/1/edit").should route_to("symptoms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/symptoms").should route_to("symptoms#create")
    end

    it "routes to #update" do
      put("/symptoms/1").should route_to("symptoms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/symptoms/1").should route_to("symptoms#destroy", :id => "1")
    end

  end
end
