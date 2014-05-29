require "spec_helper"

describe NovinkiesController do
  describe "routing" do

    it "routes to #index" do
      get("/novinkies").should route_to("novinkies#index")
    end

    it "routes to #new" do
      get("/novinkies/new").should route_to("novinkies#new")
    end

    it "routes to #show" do
      get("/novinkies/1").should route_to("novinkies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/novinkies/1/edit").should route_to("novinkies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/novinkies").should route_to("novinkies#create")
    end

    it "routes to #update" do
      put("/novinkies/1").should route_to("novinkies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/novinkies/1").should route_to("novinkies#destroy", :id => "1")
    end

  end
end
