class CountriesController < ApplicationController
  before_action :require_user
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

  def get_players
    p "----------------#{params.inspect}---------"
    if params[:squad_id].blank?
      available_players = Player.where(country_id: params[:country_id] )
    else
      all_players = Player.where(country_id: params[:country_id] ).pluck(:id)
      squad_players = SquadPlayer.where(squad_id: params[:squad_id]).pluck(:player_id)
      remaining_players = all_players - squad_players
      available_players = Player.where(:id => remaining_players)
    end  
    p "------------------------#{available_players.inspect}------"
    render :json => {:players => available_players}


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