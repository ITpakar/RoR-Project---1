class CodesController < ApplicationController
  before_action :authenticate_scope
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
    authorize! :read, Code
    respond_to do |format|
      format.html
      format.json { render json: CodeDatatable.new(view_context) }
    end
  end

  def show
    authorize! :read, Code
  end

  def new
    authorize! :create, Code
    @code = Code.new
  end

  def edit
    authorize! :update, Code
  end

  def create  
    authorize! :create, Code
    @code = Code.new(code_params)
    @code.save
  end

  def update
    authorize! :udpate, Code
    @code.update(code_params)
    respond_with(@code)
  end

  def destroy
    authorize! :destroy, Code
    @code.deleted = 1
    @code.save
  end

  def get_innings
    authorize! :read, Code
    code = Code.find_by_id(params[:code_id])
    render :json => {:code => code}
  end

  private
  def set_code
    @code = Code.find(params[:id])
  end

  def code_params
    params.require(:code).permit(:name, :default_innings)
  end
end
