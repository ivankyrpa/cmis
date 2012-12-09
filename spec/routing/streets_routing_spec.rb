require "spec_helper"

describe StreetsController do
  describe "routing" do

    it "routes to #index" do
      get("/streets").should route_to("streets#index")
    end

    it "routes to #new" do
      get("/streets/new").should route_to("streets#new")
    end

    it "routes to #show" do
      get("/streets/1").should route_to("streets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/streets/1/edit").should route_to("streets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/streets").should route_to("streets#create")
    end

    it "routes to #update" do
      put("/streets/1").should route_to("streets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/streets/1").should route_to("streets#destroy", :id => "1")
    end

  end
end
