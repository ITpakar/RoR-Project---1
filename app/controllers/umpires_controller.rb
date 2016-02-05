class UmpiresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_umpire, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json

  def index
    authorize! :read, Umpire
    respond_to do |format|
      format.html
      format.json { render json: UmpireDatatable.new(view_context) }
    end
  end

  def show
    authorize! :read, Umpire
  end

  def new
    authorize! :create, Umpire
    @umpire = Umpire.new
  end

  def edit
    authorize! :update, Umpire
  end

  def create
    authorize! :create, Umpire
    @umpire = Umpire.new(umpire_params)
    @umpire.save
  end

  def update
    authorize! :update, Umpire
    @umpire.update(umpire_params)
    respond_with(@umpire)
  end

  def destroy
    authorize! :destroy, Umpire
    @umpire.deleted = 1
    @umpire.save
  end

  private
  def set_umpire
    @umpire = Umpire.find(params[:id])
  end

  def umpire_params
    params.require(:umpire).permit(:name, :country_id)
  end
end
