require "spec_helper"

describe LRecommendationsController do
  describe "routing" do

    it "routes to #index" do
      get("/l_recommendations").should route_to("l_recommendations#index")
    end

    it "routes to #new" do
      get("/l_recommendations/new").should route_to("l_recommendations#new")
    end

    it "routes to #show" do
      get("/l_recommendations/1").should route_to("l_recommendations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/l_recommendations/1/edit").should route_to("l_recommendations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/l_recommendations").should route_to("l_recommendations#create")
    end

    it "routes to #update" do
      put("/l_recommendations/1").should route_to("l_recommendations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/l_recommendations/1").should route_to("l_recommendations#destroy", :id => "1")
    end

  end
end
