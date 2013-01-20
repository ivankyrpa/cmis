require "spec_helper"

describe FCharacteristicsController do
  describe "routing" do

    it "routes to #index" do
      get("/f_characteristics").should route_to("f_characteristics#index")
    end

    it "routes to #new" do
      get("/f_characteristics/new").should route_to("f_characteristics#new")
    end

    it "routes to #show" do
      get("/f_characteristics/1").should route_to("f_characteristics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/f_characteristics/1/edit").should route_to("f_characteristics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/f_characteristics").should route_to("f_characteristics#create")
    end

    it "routes to #update" do
      put("/f_characteristics/1").should route_to("f_characteristics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/f_characteristics/1").should route_to("f_characteristics#destroy", :id => "1")
    end

  end
end
