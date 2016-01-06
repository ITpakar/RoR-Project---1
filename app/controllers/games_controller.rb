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
  
  def scoring
    
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

  def load_innings
    game_id = params[:game][:id]
    @game = Game.find(game_id) unless game_id.blank?
  end

 def load_scores
    game_id = params[:game][:id]
    @game = Game.find(game_id)    
    @game.update(game_params) unless @game.nil? 
    @game_players = GameSquad.includes(:player).references(:player).where(:game_id => game_id, :selected => true)
    @countries = [[@game.squad_1.country.id, @game.squad_1.country.name], [@game.squad_2.country.id, @game.squad_2.country.name]]
  end
  
  def load_game_squads
    game_id = params[:team][:game_id]    
    if !game_id.blank? then
      @game = Game.find(game_id) unless game_id.blank?    
      @countries = [[@game.squad_1.country.name, @game.squad_1.id], [@game.squad_2.country.name, @game.squad_2.id]]     
    end      
  end  
  
  def load_game_squad
    squad_id = params[:team][:squad_id]
    #@game = game
    @type = params[:type]
    #@team = Team.new
    @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => squad_id)
  end
  
  def scoring_save
    
  end
  
  private
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:id, :match_date, :code_id, :name, :squad_1_id, :squad_2_id, :location_id, :number_of_innings, 
        game_team_1_squads_attributes: [:id, :player_id, :squad_id, :selected, :captain, :wicket_keeper], 
        game_team_2_squads_attributes: [:id, :player_id, :squad_id, :selected, :captain, :wicket_keeper], 
        innings_attributes: [:id, :game_id, :batting], 
        stats_attributes: [
          :id, :inning_id, :player_id, 
          :runs, :minutes, :balls, :fours, :sixes, :run_out, :bowled_by, :caught_by, 
          :overs, :maidens, :runs_against, :zeroes_against, :fours_against, :sixes_against, :no_balls, :wides, :wickets,  
          :created_at, :updated_at
        ])
    end
end
