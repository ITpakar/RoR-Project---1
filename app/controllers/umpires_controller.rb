class UmpiresController < ApplicationController
  before_action :require_user
  before_action :set_umpire, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
	respond_to do |format|
      format.html
      format.json { render json: UmpireDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @umpire = Umpire.new
  end

  def edit
  end

  def create
    @umpire = Umpire.new(umpire_params)
    @umpire.save
  end

  def update
    @umpire.update(umpire_params)
    respond_with(@umpire)
  end

  def destroy
    @umpire.deleted = 1
	  @umpire.save
  end

  private
    def set_umpire
      @umpire = Umpire.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def umpire_params
      params.require(:umpire).permit(:name, :country)
    end
end
