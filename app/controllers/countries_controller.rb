class CountriesController < ApplicationController
  before_action :authenticate_scope
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
    authorize! :read, Country
    respond_to do |format|
      format.html
      format.json { render json: CountryDatatable.new(view_context) }
    end
  end

  def show
    authorize! :read, Country
  end

  def new
    authorize! :create, Country
    @country = Country.new
  end

  def edit
    authorize! :update, Country
  end

  def create
    authorize! :create, Country
    @country = Country.new(country_params)
    if @country.save
      @country.code_ids = params[:country][:code_ids]
    end
  end

  def update
    authorize! :update, Country
    params[:country][:code_ids] ||= []
    if @country.update(country_params)
      @country.code_ids = params[:country][:code_ids]
    end 
    respond_with(@country)
  end

  def destroy
    authorize! :destroy, Country
    @country.deleted = 1
    @country.save
  end

  def get_players
    authorize! :read, Country

    dob_limit = '1965/01/1'
    if params[:squad_id].blank?
      available_players = Player.where(country_id: params[:country_id] ).where('dob > ?', dob_limit)
    else
      all_players = Player.where(country_id: params[:country_id] ).pluck(:id)
      squad_players = SquadPlayer.where(squad_id: params[:squad_id]).pluck(:player_id)
      remaining_players = all_players - squad_players
      available_players = Player.where(:id => remaining_players).where('dob > ?', dob_limit)
    end

    render :json => {:players => available_players}
  end

  def get_countries
    @code = Code.find_by_id(params[:code_id])
    @countries = @code.countries
    render :json => {:countries => @countries}
  end
  
  private
  def set_country
    @country = Country.find(params[:id])
  end
  
  def country_params
    params.require(:country).permit(:name)
  end
end