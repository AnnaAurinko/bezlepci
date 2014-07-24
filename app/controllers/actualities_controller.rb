class ActualitiesController < ApplicationController
  before_action :set_actuality, only: [:show]

  # GET /actualities
  # GET /actualities.json
  def index
    @actualities = Actuality.all
  end

  # GET /actualities/1
  # GET /actualities/1.json
  def show
    @actuality = Actuality.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actuality
      @actuality = Actuality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actuality_params
      params.require(:actuality).permit(:title, :body)
    end
end
