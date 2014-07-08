require "spec_helper"

describe Admin::PlacesController do
  describe "GET index" do
    it "denies non-admin access" do
      get :index
      expect(response).to be_redirect
    end

    it "works for admins" do
      user = FactoryGirl.create(:user, admin: true)

      sign_in user

      get :index
      expect(response).to render_template(:index)
    end
  end
end
