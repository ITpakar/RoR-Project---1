class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
    authorize! :access, Team
    respond_to do |format|
      format.html {}
      format.json { render json: TeamDatatable.new(view_context) }
    end
  end

  def show
    authorize! :access, Team
  end
  
  def team_builder
    authorize! :access, Team
  end
  
  def display_teams
    authorize! :access, Team
  end

  def new
    authorize! :access, Team
    @team = Team.new
  end

  def edit
    authorize! :access, Team
  end

  def create
    authorize! :access, Team
    @team = Team.new(team_params)
    @team.save
  end

  def update
    authorize! :access, Team
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    authorize! :access, Team
    @team.deleted = 1
	  @team.save
  end

  def team_builder_save
    authorize! :access, Team
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
    authorize! :access, Team
    game_id = params[:team][:game_id]    
    if !game_id.blank? then
      @game = Game.find(game_id) unless game_id.blank? 
      @teams = Team.where(game_id: game_id).pluck(:name, :id)
    end     
  end  
  
  def load_team
    authorize! :access, Team
    @team_id = params[:team][:team_id]
    @type = params[:type]
    @squad_players = TeamPlayer.includes(:player).references(:player).where(:team_id => @team_id)
    @stat = Stat
      .includes(inning: [:game], player: [:team_players])
      .references(inning:[:game], player: [:team_players])
      .where(:team_players => { team_id: @team_id })
    @game = Game
      .includes(:innings, :teams)
      .references(:innings, :teams)
      .where(:teams => {:id => @team_id}).first
    
    @stats = {}
    @stat.each do |t|
      if @stats[t.inning_id].nil? then 
        @stats[t.inning_id] = {}
       end
       @stats[t.inning_id][t.player_id] = t   
    end
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