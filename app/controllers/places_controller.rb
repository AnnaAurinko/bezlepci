# encoding: utf-8
class PlacesController < ApplicationController
  before_action :set_place, only: [:show]
  before_action :authenticate!, only: [:create, :new]

  # GET /places
  def index
    @places = Place.all
    @new_places = Place.all.sort_by(&:created_at).reverse.take(8)
    @actualities = Actuality.all.sort_by(&:created_at)
  end

  # GET /places/1
  def show
  end

  # GET /places/new
  def new
    @tags = {
      'Restaurace'  => ["Bezlepkové", "Pizzerie", "Palačinkárna", "Vstřícné k BL", "Pro děti"],
      'Obchod' => ["Bezlepkové obchody", "Rozšířená nabídka BL", "Základní nabídka BL", "Farmářské trhy"], 
      'Pivo' => ["Pivo"],
      'Kavarny' => ["Kavarna"]
    }

    @place = Place.new
    @users = User.all
  end

  # POST /places
  def create
    @place = Place.new(place_params)
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
   

    @place.user_id = current_user.id if current_user

    respond_to do |format|
      if @place.save
        format.html { redirect_to places_path, notice: 'Place was successfully created.' }
        format.json { render action: 'index', status: :created, location: @place }
      else
        format.html { render action: 'new', notice: "Something went wrong: #{@place.errors}" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :address, :description, :user_id, :tag_list)
    end

    def authenticate!
      redirect_to root_path unless current_user
    end
end
