class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
	respond_to do |format|
      format.html
      format.json { render json: CountryDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @country = Country.new
  end

  def edit
  end

  def create
    @country = Country.new(country_params)
    @country.save
  end

  def update
    @country.update(country_params)
    respond_with(@country)
  end

  def destroy
    @country.deleted = 1
	@country.save
  end

  private
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def country_params
      params.require(:country).permit(:name)
    end
end
