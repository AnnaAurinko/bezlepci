class UsersController < ApplicationController

  def index

  end

  def show

  end
  
  def edit

  end

  def update
   @user = User.find(params[:id])
   @user.update_attributes(users_params)
   redirect_to root_path, notice: "User was updated!"
  end

  def destroy

  end

  private
    def users_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
