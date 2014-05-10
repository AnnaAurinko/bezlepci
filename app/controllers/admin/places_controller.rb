class Admin::PlacesController < Admin::ApplicationController

  def index
    @places = Place.all
  end

end
