require "spec_helper"

describe ActualitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/actualities").should route_to("actualities#index")
    end

    it "routes to #new" do
      get("/actualities/new").should route_to("actualities#new")
    end

    it "routes to #show" do
      get("/actualities/1").should route_to("actualities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/actualities/1/edit").should route_to("actualities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/actualities").should route_to("actualities#create")
    end

    it "routes to #update" do
      put("/actualities/1").should route_to("actualities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/actualities/1").should route_to("actualities#destroy", :id => "1")
    end

  end
end
