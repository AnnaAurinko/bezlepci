class Admin::ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_variables
  layout "admin"

  private
  def authorize
    unless current_user && current_user.admin
      redirect_to root_path, notice: "Not authorized to view this section"
    end
  end

  def set_variables
    @users = User.all
    @places = Place.all

    @coffee = Place.where(specification: "coffee")
    @shop = Place.where(specification: "shop")
    @beer = Place.where(specification: "beer")
    @restaurant = Place.where(specification: "restaurant")
  end
end
