class SeriesController < ApplicationController
  before_action :authenticate_scope
  before_action :set_series, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json

  def index
    authorize! :read, Series
    respond_to do |format|
      format.html
      format.json { render json: SeriesDatatable.new(view_context) }
    end
  end

  def show
    authorize! :read, Series
  end

  def new
    authorize! :create, Series
    @series = Series.new
  end

  def edit
    authorize! :update, Series
  end

  def create
    authorize! :create, Series
    @series = Series.new(series_params)
    if @series.save
      @series.country_ids = params[:series][:country_ids]
    end
  end

  def update
    authorize! :update, Series
    params[:series][:country_ids] ||= []
    if @series.update(series_params)
      @series.country_ids = params[:series][:country_ids]
    end
    respond_with(@series)
  end

  def destroy
    authorize! :destroy, Series
    @series.deleted = 1
    @series.save
  end


  def get_series
    @country = Country.find_by_id(params[:country_id])
    @series = @country.series
    render :json => {:series => @series}
  end

  private
  def set_series
    @series = Series.find(params[:id])
  end

  def series_params
    params.require(:series).permit(:name)
  end
end
