class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
