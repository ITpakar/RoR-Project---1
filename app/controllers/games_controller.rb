class GamesController < ApplicationController
  before_action :require_user
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
    #respond_with(@game)
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

      #@countries = [[@game.squad_1.country.name, @game.squad_1.country.id], [@game.squad_2.country.name, @game.squad_2.country.id]]  
      @countries = [@game.squad_1.country.id, @game.squad_2.country.id]
      @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => @countries)

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

  def quick_add_game_type
  end

  def save_quick_add_game_type 
   @code = Code.create(:name =>params[:name],:default_innings=> params[:default_innings].to_i)
  end

  def quick_add_country
  end

  def save_quick_add_country
     @country = Country.create(:name => params[:name])
  end

  def quick_add_location
  end

  def save_quick_add_location
    @location = Location.create(:name => params[:name],:country_id=>params[:country_id])
  end

  def quick_add_player
    @squad_id = params[:squad_id]
    @type = params[:type]
    @player = Player.new
    #@country=Country.find_by_id(params[:country_id])
  end

  def save_quick_add_player
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
    p "--------------------#{params.inspect}-----"
    @squad = Squad.find_by_id(params[:squad_id])
    @squad_type = params[:type]
  end

  def save_existing_player
  end


  def quick_add_squad
    @squad_type = params[:squad]
    @squad = Squad.new
  end

  def save_quick_add_squad
    @squad_type = params[:type]
    players = params[:squad][:column_data].split(':') unless params[:squad][:column_data].nil?
    @squad = Squad.new(squad_params)    
    if !players.nil? && players.count > 0 then
      players.each do |player|
        @squad.squad_players.new(squad: @squad, player_id: player)
      end
    end    
    @squad.save
    @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => @squad.id)
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

    def player_params
      params.require(:player).permit(:name, :country_id, :batting_style, :bowling_style, :role,:dob)
    end

    def squad_params
      params.require(:squad).permit(:code_id, :country_id, :column_data, :available_players,:description)
    end

end
