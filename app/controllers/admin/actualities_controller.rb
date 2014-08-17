class Admin::ActualitiesController < Admin::ApplicationController

  def index
    @actualities = Actuality.all
  end

  def show
    @actuality = Actuality.find(params[:id])
  end

  def new
    @actuality = Actuality.new
  end

  def create
    actuality = Actuality.new(params.require(:actuality).permit!)
    if actuality.save
      redirect_to admin_actuality_path(actuality), notice: "Actuality updated!"
    else
      redirect_to edit_admin_actuality_path, alert: "Couldn't update actuality"
    end
  end

  def edit
    @actuality  = Actuality.find(params[:id])
  end

  def update
    @actuality = Actuality.find(params[:id])
    @actuality.update(params.require(:actuality).permit!)
    if @actuality.save
      redirect_to admin_actuality_path(@actuality), notice: "Actuality updated!"
    else
      redirect_to edit_admin_actuality_path, alert: "Couldn't update actuality"
    end
  end

  def destroy
    actuality  = Actuality.find(params[:id])
    actuality .destroy
    redirect_to admin_actualitis_path, notice: "Actuality was deleted"
  end
end
