 class SquadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_squad, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
    authorize! :read, Squad
    respond_to do |format|
      format.html
      format.json { render json: SquadDatatable.new(view_context) }
    end
  end

  def show
    authorize! :read, Squad
  end

  def new
    authorize! :new, Squad
    @squad = Squad.new
  end

  def edit
    authorize! :udpate, Squad
  end

  def create
    authorize! :create, Squad
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
    authorize! :udpate, Squad
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
    authorize! :destroy, Squad
    @squad.deleted = 1
    @squad.save
  end

  def get_squad_select  
    authorize! :read, Squad
    code = params[:game][:code_id] 
    @squads = Squad.where(:code_id => code, :deleted => 0)    
    @code = Code.find(code)
    puts @code.attributes
  end
  
  def load_squad_1
    authorize! :read, Squad
    @squad_id = params[:squad_id]
    @type = params[:type]
    @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => @squad_id)   
  end  
  def load_squad_2
    authorize! :read, Squad
    @squad_id = params[:squad_id]
    @type = params[:type]
    @squad_players = SquadPlayer.includes(:player).references(:player).where(:squad_id => @squad_id)
  end
  
  def save_squad
    authorize! :create, Squad
  end

  def get_squads
    authorize! :read, Squad
    @squads = Squad.where(:code_id=>params[:code_id],:country_id=>params[:country_id])
    render :json => {:squads => @squads}
  end

  def remove_player
    authorize! :destroy, Player
    squad_id = SquadPlayer.find_by_id(params[:squad_player_id]).squad_id 
    SquadPlayer.find_by_id(params[:squad_player_id]).delete
    if params[:squad] == "squad_1"
      redirect_to squad_load_1_path(:squad_id => squad_id,format: :js)
    else
      redirect_to squad_load_2_path(:squad_id => squad_id,format: :js)
    end
  end

  private
  def set_squad
    @squad = Squad.find(params[:id])
  end

  def squad_params
    params.require(:squad).permit(:code_id, :country_id, :column_data, :available_players,:description)
  end
end
