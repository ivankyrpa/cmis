require "spec_helper"

describe AnalysisTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/analysis_types").should route_to("analysis_types#index")
    end

    it "routes to #new" do
      get("/analysis_types/new").should route_to("analysis_types#new")
    end

    it "routes to #show" do
      get("/analysis_types/1").should route_to("analysis_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/analysis_types/1/edit").should route_to("analysis_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/analysis_types").should route_to("analysis_types#create")
    end

    it "routes to #update" do
      put("/analysis_types/1").should route_to("analysis_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/analysis_types/1").should route_to("analysis_types#destroy", :id => "1")
    end

  end
end
