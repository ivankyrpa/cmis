require "spec_helper"

describe PacientsController do
  describe "routing" do

    it "routes to #index" do
      get("/pacients").should route_to("pacients#index")
    end

    it "routes to #new" do
      get("/pacients/new").should route_to("pacients#new")
    end

    it "routes to #show" do
      get("/pacients/1").should route_to("pacients#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pacients/1/edit").should route_to("pacients#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pacients").should route_to("pacients#create")
    end

    it "routes to #update" do
      put("/pacients/1").should route_to("pacients#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pacients/1").should route_to("pacients#destroy", :id => "1")
    end

  end
end
