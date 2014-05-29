class ActualitiesController < ApplicationController
  before_action :set_actuality, only: [:show, :edit, :update, :destroy]

  # GET /actualities
  # GET /actualities.json
  def index
    @actualities = Actuality.all
  end

  # GET /actualities/1
  # GET /actualities/1.json
  def show
  end

  # GET /actualities/new
  def new
    @actuality = Actuality.new
  end

  # GET /actualities/1/edit
  def edit
  end

  # POST /actualities
  # POST /actualities.json
  def create
    @actuality = Actuality.new(actuality_params)

    respond_to do |format|
      if @actuality.save
        format.html { redirect_to @actuality, notice: 'Actuality was successfully created.' }
        format.json { render action: 'show', status: :created, location: @actuality }
      else
        format.html { render action: 'new' }
        format.json { render json: @actuality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actualities/1
  # PATCH/PUT /actualities/1.json
  def update
    respond_to do |format|
      if @actuality.update(actuality_params)
        format.html { redirect_to @actuality, notice: 'Actuality was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @actuality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actualities/1
  # DELETE /actualities/1.json
  def destroy
    @actuality.destroy
    respond_to do |format|
      format.html { redirect_to actualities_url }
      format.json { head :no_content }
    end
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
