class Admin::PlacesController < ApplicationController
  before_action :authorizate

  def index
    @places = Place.all
  end

  private
  def authorizate
    unless current_user && current_user.admin
      redirect_to root_path
    end
  end
end
