require "spec_helper"

describe Admin::PlacesController do
  it "GET index" do 
    user = FactoryGirl.create(:user)
    user.admin = true
    user.save

    GET :index
    expect(response).to render_template(:index)
  end


end
