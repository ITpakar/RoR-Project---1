class LocationsController < ApplicationController
 before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
    authorize! :read, Location
    respond_to do |format|
      format.html
      format.json { render json: LocationDatatable.new(view_context) }
    end
  end

  def show
    authorize! :read, Location
  end

  def new
    authorize! :create, Location
    @location = Location.new
  end

  def edit
    authorize! :udpate, Location
  end

  def create
    authorize! :create, Location
    @location = Location.new(location_params)
    @location.save
  end

  def update
    authorize! :udpate, Location
    @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    authorize! :destroy, Location
    @location.deleted = 1
    @location.save
  end

  private
  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :country_id)
  end
end
