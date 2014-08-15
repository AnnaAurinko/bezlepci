class Api::PlacesController < ApplicationController
  def index
    place = []
    tags = ["Restaurace", "Obchod", "Bezlepkové", "Pizzerie", "Palačinkárna", "Vstřícné k BL", "Pro děti", "Bezlepkové obchody", "Rozšířená nabídka BL", "Základní nabídka BL", "Farmářské trhy", "Pivo", "Kavárna"]

    tags.each do |tag|
      if params[:tags] && params[:tags].include?(tag)
        place << Place.tagged_with(tag)
      end
    end

    unless params[:tags]
      place = Place.all
    end

    render json: place.flatten, root: false
  end
end
