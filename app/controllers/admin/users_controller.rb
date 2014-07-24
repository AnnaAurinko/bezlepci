class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit!)
    if @user.save
      redirect_to admin_user_path(@user), notice: "Place updated!"
    else
      redirect_to edit_admin_user_path, alert: "Couldn't update place"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path, notice: "User was deleted"
  end
end
