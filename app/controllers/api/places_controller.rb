class Api::PlacesController < ApplicationController
  def index
    place = []

    if params[:tags] && params[:tags].include?("Restaurace")
      place << Place.tagged_with("Restaurace")
    end

    if params[:tags] && params[:tags].include?("Obchod")
      place << Place.tagged_with("Obchod") 
    end

    if params[:tags] && params[:tags].include?("Pivo")
      place << Place.tagged_with("Pivo") 
    end

    if params[:tags] && params[:tags].include?("Kavarna")
      place << Place.tagged_with("Kavarna")
    end 
    
    unless params[:tags]
      place = Place.all
    end

    render json: place.flatten, root: false
  end
end
