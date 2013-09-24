class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    redirect_to root_path
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    redirect_to root_path
  end

  # GET /locations/new
  def new
    redirect_to root_path
  end

  # GET /locations/1/edit
  def edit
    redirect_to root_path
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    redirect_to root_path
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:zip_code, :lat_long, :street, :latitude, :longitude, :gmaps)
    end
end
