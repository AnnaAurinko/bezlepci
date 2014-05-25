class Api::PlacesController < ApplicationController
  def index
    render json: Place.all, root: false
  end
end
