class PlayersController < ApplicationController
  before_action :require_user
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
	respond_to do |format|
      format.html
      format.json { render json: PlayerDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)
    @player.save
  end

  def update
    @player.update(player_params)
    respond_with(@player)
  end

  def destroy
    @player.deleted = 1
	@player.save
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:name, :country_id, :batting_style, :bowling_style, :role,:dob)
    end
end
