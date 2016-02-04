class Admin::SessionsController < ApplicationController

  def create
    admin = User.find_by_email(params[:admin][:email])
    if admin
      if admin.admin?
        if admin.valid_password? params[:admin][:password]
          sign_in admin
          redirect_to after_sign_in_path_for(admin), :notice => 'Signed in successfully..'
        else
          redirect_to admin_sign_in_path, :alert => 'Invalid email/password.'
        end
      else
        redirect_to admin_sign_in_path, :notice => 'Only Admin can login here.'
      end
    else
      redirect_to admin_sign_in_path, :alert => 'Invalid email/password.'
    end
  end

end
