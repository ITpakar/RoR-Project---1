class ManageUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  def index
    authorize! :read, User
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(view_context) }
    end
  end

  def show
    # authorize! :read, User
  end

  def new
    # authorize! :create, User
    @user = User.new
    @profile = @user.build_profile
  end

  def edit
    # authorize! :update, User
  end

  def create  
    # authorize! :create, User
    @user = User.new(user_params)
    @user.save
  end

  def update
    # authorize! :udpate, User
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    # authorize! :destroy, User
    @user.destroy
  end

  private
  def set_user
    @user = User.includes(:profile).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, 
      :profile_attributes => [:firstname, :lastname, :screenname, :phone_number, :address, :id])
  end

end
