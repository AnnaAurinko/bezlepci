class Admin::PlacesController < Admin::ApplicationController

  def index
    @places = Place.all
  end
  
  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
   place = Place.create(params.require(:place).permit!)
   if place.save
     redirect_to admin_place_path, notice: "Place updated!"
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
