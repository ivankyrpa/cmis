require "spec_helper"

describe SettlementsController do
  describe "routing" do

    it "routes to #index" do
      get("/settlements").should route_to("settlements#index")
    end

    it "routes to #new" do
      get("/settlements/new").should route_to("settlements#new")
    end

    it "routes to #show" do
      get("/settlements/1").should route_to("settlements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/settlements/1/edit").should route_to("settlements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/settlements").should route_to("settlements#create")
    end

    it "routes to #update" do
      put("/settlements/1").should route_to("settlements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/settlements/1").should route_to("settlements#destroy", :id => "1")
    end

  end
end
