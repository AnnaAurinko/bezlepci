class Api::PlacesController < ApplicationController
  def index
    @geojson = Array.new
    @places = Place.all

    @places.each do |place|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [place.longitude, place.latitude]
        },
        properties: {
          name: place.name,
          address: place.address,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end

    render json: @geojson  # respond with the created JSON object
  end
end
