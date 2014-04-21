require 'spec_helper'

describe Place do
  it "has a valid factory" do
    FactoryGirl.build(:place).should be_valid
  end
end
