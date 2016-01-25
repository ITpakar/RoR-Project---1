class CodesController < ApplicationController
  before_action :require_user
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
	respond_to do |format|
      format.html
      format.json { render json: CodeDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @code = Code.new
  end

  def edit
  end

  def create  
    @code = Code.new(code_params)
    @code.save
  end

  def update
    @code.update(code_params)
    respond_with(@code)
  end

  def destroy
    @code.deleted = 1
	@code.save
  end

  def get_innings
    code = Code.find_by_id(params[:code_id])
    render :json => {:code => code}
  end

  private
    def set_code
      @code = Code.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def code_params
      params.require(:code).permit(:name, :default_innings)
    end
end
