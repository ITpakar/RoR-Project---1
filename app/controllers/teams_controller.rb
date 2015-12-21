class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
	respond_to do |format|
      format.html
      format.json { render json: TeamDatatable.new(view_context) }
    end
  end

  def show
  end
  
  def team_builder
    
  end
  
  def display_teams
    
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.save
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.deleted = 1
	  @team.save
  end

  def team_builder_save    
    players = params[:team][:team_players_attributes]    
    pp = []    
    players.each do |player|
      if player.second['selected'] != '0' then 
        pp << player.second
      end
    end
    params[:team][:team_players_attributes] = pp
    @team = Team.new(team_params)
    @team.save
    
  end
  
  def load_teams
    game_id = params[:team][:game_id]    
    if !game_id.blank? then
      @game = Game.find(game_id) unless game_id.blank?    
      @countries = [[@game.squad_1.country.name, @game.squad_1.country.id], [@game.squad_2.country.name, @game.squad_2.country.id]]     
    end     
  end  
  
  def load_team
    team_id = params[:team][:team_id]
    @type = params[:type]
    @squad_players = TeamPlayer.includes(:player).references(:player).where(:team_id => team_id)
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:id, :squad_id, :game_id, :name, team_players_attributes: [:id, :player_id, :captain, :selected, :wicket_keeper])
    end
end

