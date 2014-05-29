require 'spec_helper'

describe "Novinkies" do
  describe "GET /novinkies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get novinkies_path
      response.status.should be(200)
    end
  end
end
