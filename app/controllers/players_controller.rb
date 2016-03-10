class PlayersController < ApplicationController
  before_action :authenticate_scope
  before_action :set_player, only: [:profile, :show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :update
  respond_to :html, :js, :json
  
  def index
    authorize! :read, Player
    respond_to do |format|
      format.html
      format.json { render json: PlayerDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    authorize! :new, Player
    @player = Player.new
  end

  def edit
    authorize! :edit, Player
  end

  def create
    authorize! :create, Player
    @player = Player.new(player_params)
    @player.save
  end

  def update
    @player.update(player_params)
    respond_with(@player)
  end

  def destroy
    authorize! :destroy, Player
    @player.deleted = 1
    @player.save
  end

  def profile
  end

  private
    def set_player
      @player = Player.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      # params[:player][:dob] = convert_to_database_date(params[:player][:dob])
      params.require(:player).permit(:name, :country_id, :batting_style, :bowling_style, :role,:dob,:full_name,:scorecard_name, :image, :image_source_url)
    end


    def convert_to_database_date date
      array = date.split('/')
      

    unless array[1].nil?
      #new_date = Date.strptime("#{array[2]}/#{array[0]}/#{array[1]}", "%Y/%m/%d")
      new_date = "#{array[2]}-#{array[1]}-#{array[0]}" 
    else
      new_date = date
    end
      new_date   
     end

end
