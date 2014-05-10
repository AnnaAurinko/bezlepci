class Admin::ApplicationController < ActionController::Base
  before_action :authorize
  layout "admin"

  private
  def authorize
    unless current_user && current_user.admin
      redirect_to root_path, notice: "Not authorized to view this section"
    end
  end
end
