require "spec_helper"

describe TreatmentTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/treatment_types").should route_to("treatment_types#index")
    end

    it "routes to #new" do
      get("/treatment_types/new").should route_to("treatment_types#new")
    end

    it "routes to #show" do
      get("/treatment_types/1").should route_to("treatment_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/treatment_types/1/edit").should route_to("treatment_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/treatment_types").should route_to("treatment_types#create")
    end

    it "routes to #update" do
      put("/treatment_types/1").should route_to("treatment_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/treatment_types/1").should route_to("treatment_types#destroy", :id => "1")
    end

  end
end
