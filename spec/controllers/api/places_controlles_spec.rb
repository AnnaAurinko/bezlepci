require "spec_helper"

describe Api::PlacesController do
  describe "GET index" do
    it "renders correct jsons" do
      place = create(:place)
      place.tag_list << "Restaurace"
      place.save
      
      place2 = create(:place)
      place2.tag_list << "Pivo"
      place2.save

      place3 = create(:place)
      place3.tag_list = []
      place3.save

      get :index, tags: ["Restaurace"]

      JSON.parse(response.body).count.should eql(1)

      get :index, tags: ["Pivo", "Obchod", "Restaurace"]
      JSON.parse(response.body).count.should eql(2)
      JSON.parse(response.body).last["properties"]["tags"].first["name"].should eql("Pivo")
    end
  end
end


