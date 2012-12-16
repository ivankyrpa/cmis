require "spec_helper"

describe PoliciesController do
  describe "routing" do

    it "routes to #index" do
      get("/policies").should route_to("policies#index")
    end

    it "routes to #new" do
      get("/policies/new").should route_to("policies#new")
    end

    it "routes to #show" do
      get("/policies/1").should route_to("policies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/policies/1/edit").should route_to("policies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/policies").should route_to("policies#create")
    end

    it "routes to #update" do
      put("/policies/1").should route_to("policies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/policies/1").should route_to("policies#destroy", :id => "1")
    end

  end
end
