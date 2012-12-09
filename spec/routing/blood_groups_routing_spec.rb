require "spec_helper"

describe BloodGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/blood_groups").should route_to("blood_groups#index")
    end

    it "routes to #new" do
      get("/blood_groups/new").should route_to("blood_groups#new")
    end

    it "routes to #show" do
      get("/blood_groups/1").should route_to("blood_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blood_groups/1/edit").should route_to("blood_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blood_groups").should route_to("blood_groups#create")
    end

    it "routes to #update" do
      put("/blood_groups/1").should route_to("blood_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blood_groups/1").should route_to("blood_groups#destroy", :id => "1")
    end

  end
end
