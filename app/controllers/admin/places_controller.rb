class Admin::PlacesController < Admin::ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @tags = {
      'Restaurace'  => ["Bezlepkové", "Pizzerie", "Palačinkárna", "Vstřícné k BL", "Pro děti"],
      'Obchod' => ["Bezlepkové obchody", "Rozšířená nabídka BL", "Základní nabídka BL", "Farmářské trhy"], 
      'Pivo' => ["Pivo"],
      'Kavarny' => ["Kavarny"]
    }

    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.tag_list = params[:tag_list]
   
    restaurants = ["Bezlepkové", "Pizzerie", "Palačinkárna", "Vstřícné k BL", "Pro děti"]
    shops = ["Bezlepkové obchody", "Rozšířená nabídka BL", "Základní nabídka BL", "Farmářské trhy"]

    if params[:tag_list]
      restaurants.each do |tag|
        if params[:tag_list].include?(tag)
          @place.tag_list << "Restaurace" 
        end
      end

      shops.each do |tag|
        if params[:tag_list].include?(tag)
          @place.tag_list << "Obchod"
        end
      end
    end
   
    @place.update(params.require(:place).permit!)
    if @place.save
      redirect_to admin_place_path(@place), notice: "Place updated!"
    else
      redirect_to edit_admin_place_path, alert: "Couldn't update place"
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    redirect_to admin_places_path, notice: "Place was deleted"
  end
end
