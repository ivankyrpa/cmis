require "spec_helper"

describe InsuranceTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/insurance_types").should route_to("insurance_types#index")
    end

    it "routes to #new" do
      get("/insurance_types/new").should route_to("insurance_types#new")
    end

    it "routes to #show" do
      get("/insurance_types/1").should route_to("insurance_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/insurance_types/1/edit").should route_to("insurance_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/insurance_types").should route_to("insurance_types#create")
    end

    it "routes to #update" do
      put("/insurance_types/1").should route_to("insurance_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/insurance_types/1").should route_to("insurance_types#destroy", :id => "1")
    end

  end
end
