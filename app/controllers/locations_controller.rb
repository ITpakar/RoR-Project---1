class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
	respond_to do |format|
      format.html
      format.json { render json: LocationDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    @location.save
  end

  def update
    @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    @location.deleted = 1
	  @location.save
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:name, :country_id)
    end
end
