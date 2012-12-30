require "spec_helper"

describe CharacteristicsSurveysController do
  describe "routing" do

    it "routes to #index" do
      get("/characteristics_surveys").should route_to("characteristics_surveys#index")
    end

    it "routes to #new" do
      get("/characteristics_surveys/new").should route_to("characteristics_surveys#new")
    end

    it "routes to #show" do
      get("/characteristics_surveys/1").should route_to("characteristics_surveys#show", :id => "1")
    end

    it "routes to #edit" do
      get("/characteristics_surveys/1/edit").should route_to("characteristics_surveys#edit", :id => "1")
    end

    it "routes to #create" do
      post("/characteristics_surveys").should route_to("characteristics_surveys#create")
    end

    it "routes to #update" do
      put("/characteristics_surveys/1").should route_to("characteristics_surveys#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/characteristics_surveys/1").should route_to("characteristics_surveys#destroy", :id => "1")
    end

  end
end
