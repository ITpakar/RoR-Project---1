class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
    authorize! :read, Game  
    respond_to do |format|
      format.html
      format.json { render json: GameDatatable.new(view_context) }
    end
  end

  def show
    authorize! :read, Game
    @game = Game.find_by_id(params[:id])
    @game_players = GameSquad.includes(:player).references(:player).where(:game_id => @game.id, :selected => true)
    @countries = [[@game.squad_1.country.id, @game.squad_1.country.name], [@game.squad_2.country.id, @game.squad_2.country.name]]
  end
  
  def scoring
    authorize! :create, Game
  end

  def new
    authorize! :create, Game
    @game = Game.new
  end

  def edit
    authorize! :update, Game
  end

  def create
    authorize! :create, Game
    @game = Game.new(game_params)
    @game.save
  end

  def update
    authorize! :update, Player
    @game.update(update_game_params)
  end

  def destroy
    authorize! :destroy, Game
    @game.deleted = 1
    @game.save
  end

  def load_innings
    authorize! :read, Game  
    game_id = params[:game][:id]
    @game = Game.find(game_id) unless game_id.blank?
  end

  def load_scores
    authorize! :read, Game  
    game_id = params[:game][:id]
    @game = Game.find(game_id)    
    @game.update(update_game_params) unless @game.nil? 
    @game_players = GameSquad.includes(:player).references(:player).where(:game_id => game_id, :selected => true)
    @countries = [[@game.squad_1.country.id, @game.squad_1.country.name], [@game.squad_2.country.id, @game.squad_2.country.name]]
  end

  def load_game_squads
    authorize! :read, Game  
    game_id = params[:team][:game_id]    
    if !game_id.blank? then
      @game = Game.find(game_id) unless game_id.blank?    

      #@countries = [[@game.squad_1.country.name, @game.squad_1.country.id], [@game.squad_2.country.name, @game.squad_2.country.id]]  
      @countries = [@game.squad_1.id, @game.squad_2.id]
      @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => @countries)

    end      
  end  
  
  def load_game_squad
    authorize! :read, Game
    squad_id = params[:team][:squad_id]
    #@game = game
    @type = params[:type]
    #@team = Team.new
    @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => squad_id)
  end
  
  def scoring_save
    authorize! :read, Game
  end

  def quick_add_game_type
  end

  def save_quick_add_game_type 
   @code = Code.create(:name =>params[:name],:default_innings=> params[:default_innings].to_i)
 end

 def quick_add_country
  authorize! :create, Game  
end

def save_quick_add_country
  authorize! :create, Game 
  @country = Country.create(:name => params[:name])
  @country.code_ids = params[:country][:code_ids]
end

def quick_add_location
  authorize! :create, Game 
end

def save_quick_add_location
  authorize! :create, Game 
  @location = Location.create(:name => params[:name],:country_id=>params[:country_id])
end

def quick_add_player
  authorize! :create, Game 
  @squad_id = params[:squad_id]
  @type = params[:type]
  @player = Player.new
    #@country=Country.find_by_id(params[:country_id])
  end

  def save_quick_add_player
    authorize! :create, Game 
    @player = Player.new(player_params)
    @player.save
    @squad_player = SquadPlayer.new(:squad_id => params[:squad_id],:player_id => @player.id)
    @squad_player.save
    
    if params[:type] == "1"
      redirect_to squad_load_1_path(:squad_id => params[:squad_id],:type=>params[:type]) 
    elsif params[:type] == "2"
      redirect_to squad_load_2_path(:squad_id => params[:squad_id],:type=>params[:type])
    end
  end

  def quick_add_existing_player
    authorize! :create, Game
    @squad = Squad.find_by_id(params[:squad_id])
    @squad_type = params[:type]
  end

  def save_existing_player
    authorize! :create, Game 
    squad =Squad.find_by_id(params[:squad_id])
    players = params[:column_data].split(':') unless params[:column_data].nil?
    SquadPlayer.where(squad_id: params[:squad_id]).delete_all
    if !players.nil? && players.count > 0 then
      players.each do |player|
        squad.squad_players.create(squad: squad, player_id: player)
      end
    end

    if params[:squad_type] == "1"
      redirect_to squad_load_1_path(:squad_id => params[:squad_id],:type=>params[:squad_type],:format=>:js) 
    elsif params[:squad_type] == "2"
      redirect_to squad_load_2_path(:squad_id => params[:squad_id],:type=>params[:squad_type],:format=>:js)
    end

  end


  def quick_add_squad
    authorize! :create, Game
    @squad_type = params[:squad]
    @squad = Squad.new
  end

  def save_quick_add_squad
    authorize! :create, Game
    @squad_type = params[:type]
    players = params[:squad][:column_data].split(':') unless params[:squad][:column_data].nil?
    @squad = Squad.new(squad_params)    
    if !players.nil? && players.count > 0 then
      players.each do |player|
        @squad.squad_players.new(squad: @squad, player_id: player)
      end
    end    
    @squad.save

    if params[:type] == "1"
      redirect_to squad_load_1_path(:format => :js,:squad_id=> @squad,:type=>params[:type] )
    elsif params[:type] == "2"
      redirect_to squad_load_2_path(:format => :js,:squad_id=> @squad,:type=>params[:type] )
    end
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
    def game_params

      params[:game][:squad_1_id] = params[:game][:squad_id_1] if params[:game][:squad_id_1].present?
      params[:game][:squad_2_id] = params[:game][:squad_id_2] if params[:game][:squad_id_2].present?

      params.require(:game).permit(:id, :match_date, :code_id, :name, :squad_1_id, :squad_2_id, :location_id, :number_of_innings,:coin_toss_win, 
        :coin_toss_decision,:game_winner,:game_winner_amount,:game_winner_margin,:day_night_game,:player_of_the_match,:umpire_1,:umpire_2,:umpire_tv,:umpire_referee,:umpire_reserve,
        game_team_1_squads_attributes: [:id, :player_id, :squad_id, :selected, :captain, :wicket_keeper], 
        game_team_2_squads_attributes: [:id, :player_id, :squad_id, :selected, :captain, :wicket_keeper], 
        innings_attributes: [:id, :game_id, :batting], 
        stats_attributes: [
          :id, :inning_id, :player_id, 
          :runs, :minutes, :balls, :fours, :sixes, :run_out, :bowled_by, :caught_by,:lbw_by,:stumped_by,:batting_order,:fow_order,:fow_score,:fow_overs,:fow_balls,
          :bowling_order,:overs,:over_partial,:maidens, :runs_against, :zeroes_against, :fours_against, :sixes_against, :no_balls, :wides, :wickets,  
          :created_at, :updated_at
          ])
    end

    def update_game_params
      params[:game][:game_winner_margin] = 0 if (params[:game][:game_winner]=="0")
      params[:game][:game_winner_amount] = 0 if (params[:game][:game_winner]=="0")
      params.require(:game).permit(:id, :match_date, :code_id, :name, :squad_1_id, :squad_2_id, :location_id, :number_of_innings,:coin_toss_win,
        :coin_toss_decision,:game_winner,:game_winner_amount,:game_winner_margin,:day_night_game,:player_of_the_match,:umpire_1,:umpire_2,:umpire_tv,:umpire_referee,:umpire_reserve,
        game_team_1_squads_attributes: [:id, :player_id, :squad_id, :selected, :captain, :wicket_keeper], 
        game_team_2_squads_attributes: [:id, :player_id, :squad_id, :selected, :captain, :wicket_keeper], 
        innings_attributes: [:id, :game_id, :batting], 
        stats_attributes: [
          :id, :inning_id, :player_id, 
          :runs, :minutes, :balls, :fours, :sixes, :run_out, :bowled_by, :caught_by,:lbw_by,:stumped_by,:batting_order,:fow_order,:fow_score,:fow_overs,:fow_balls,
          :bowling_order,:overs,:over_partial,:maidens, :runs_against, :zeroes_against, :fours_against, :sixes_against, :no_balls, :wides, :wickets,  
          :created_at, :updated_at
          ])
    end

    def player_params
      params.require(:player).permit(:name, :country_id, :batting_style, :bowling_style, :role,:dob,:full_name,:scorecard_name)
    end

    def squad_params
      params.require(:squad).permit(:code_id, :country_id, :column_data, :available_players,:description)
    end

  end
