require "spec_helper"

describe FRecommendationsController do
  describe "routing" do

    it "routes to #index" do
      get("/f_recommendations").should route_to("f_recommendations#index")
    end

    it "routes to #new" do
      get("/f_recommendations/new").should route_to("f_recommendations#new")
    end

    it "routes to #show" do
      get("/f_recommendations/1").should route_to("f_recommendations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/f_recommendations/1/edit").should route_to("f_recommendations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/f_recommendations").should route_to("f_recommendations#create")
    end

    it "routes to #update" do
      put("/f_recommendations/1").should route_to("f_recommendations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/f_recommendations/1").should route_to("f_recommendations#destroy", :id => "1")
    end

  end
end
