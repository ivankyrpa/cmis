require "spec_helper"

describe CharacteristicsController do
  describe "routing" do

    it "routes to #index" do
      get("/characteristics").should route_to("characteristics#index")
    end

    it "routes to #new" do
      get("/characteristics/new").should route_to("characteristics#new")
    end

    it "routes to #show" do
      get("/characteristics/1").should route_to("characteristics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/characteristics/1/edit").should route_to("characteristics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/characteristics").should route_to("characteristics#create")
    end

    it "routes to #update" do
      put("/characteristics/1").should route_to("characteristics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/characteristics/1").should route_to("characteristics#destroy", :id => "1")
    end

  end
end
