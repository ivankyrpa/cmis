require "spec_helper"

describe InsuranceCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/insurance_companies").should route_to("insurance_companies#index")
    end

    it "routes to #new" do
      get("/insurance_companies/new").should route_to("insurance_companies#new")
    end

    it "routes to #show" do
      get("/insurance_companies/1").should route_to("insurance_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/insurance_companies/1/edit").should route_to("insurance_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/insurance_companies").should route_to("insurance_companies#create")
    end

    it "routes to #update" do
      put("/insurance_companies/1").should route_to("insurance_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/insurance_companies/1").should route_to("insurance_companies#destroy", :id => "1")
    end

  end
end
