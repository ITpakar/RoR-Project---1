

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

  private
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params

      params.require(:team).permit(:game_id)

    end
end

