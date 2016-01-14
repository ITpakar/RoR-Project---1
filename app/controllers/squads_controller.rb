 class SquadsController < ApplicationController
  before_action :require_user
  before_action :set_squad, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
	respond_to do |format|
      format.html
      format.json { render json: SquadDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @squad = Squad.new
  end

  def edit
  end

  def create
    
    players = params[:squad][:column_data].split(':') unless params[:squad][:column_data].nil?
    @squad = Squad.new(squad_params)    
    if !players.nil? && players.count > 0 then
      players.each do |player|
        @squad.squad_players.new(squad: @squad, player_id: player)
      end
    end    
    @squad.save
    
  end

  def update
    SquadPlayer.where(squad_id: params[:id]).delete_all
    players = params[:squad][:column_data].split(':').uniq unless params[:squad][:column_data].nil?
    if !players.nil? && players.count > 0 then
      players.each do |player|
        @squad.squad_players.new(squad: @squad, player_id: player)
      end
    end
    @squad.update(squad_params)
    respond_with(@squad)
  end

  def destroy
    @squad.deleted = 1
	@squad.save
  end

  def get_squad_select  
    code = params[:game][:code_id] 
    @squads = Squad.where(:code_id => code, :deleted => 0)    
    @code = Code.find(code)
    puts @code.attributes
  end
  
  def load_squad_1

    # @squad = Squad.where(:country_id =>params[:team_id],:code_id => params[:code_id]).first
    # @type = params[:type]
    # @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => @squad.id)
    squad_id = params[:team_id]
    @type = params[:type]
    @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => squad_id)
  end  
   def load_squad_2
    
    # @squad = Squad.where(:country_id =>params[:team_id],:code_id => params[:code_id]).first
    # @type = params[:type]
    # @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => @squad.id)
    squad_id = params[:team_id]
    @type = params[:type]
    @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => squad_id)
  end
  
  def save_squad
    
  end

  def remove_player
    team_id = SquadPlayer.find_by_id(params[:squad_player_id]).squad_id 
    SquadPlayer.find_by_id(params[:squad_player_id]).delete
    if params[:squad] == "squad_1"
       redirect_to squad_load_1_path(:team_id => team_id,format: :js)
    else
       redirect_to squad_load_2_path(:team_id => team_id,format: :js)
    end
  end

  private
    def set_squad
      @squad = Squad.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def squad_params
      params.require(:squad).permit(:code_id, :country_id, :column_data, :available_players,:custom_text,:description)
    end
end
