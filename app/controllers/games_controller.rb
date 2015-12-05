class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
	respond_to do |format|
      format.html
      format.json { render json: GameDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    @game.save
  end

  def update
    @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    @game.deleted = 1
	@game.save
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:match_date)
    end
end
