require 'spec_helper'

describe Place do
  it "has a valid factory" do
    FactoryGirl.build(:place).should be_valid
  end

  it "scopes" do
    place = create(:place)

    Place.waiting.count.should eq 1
    Place.approved.count.should eq 0
  end
end
