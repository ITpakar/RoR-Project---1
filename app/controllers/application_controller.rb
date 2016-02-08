class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  
  before_filter :set_mailer_host

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root
    else
      root_path
    end
  end

  def after_update_path_for(resource)
   redirect_to edit_user_profile_path(resource, resource.profile)
 end

# exception handling for unauthorization
  rescue_from CanCan::AccessDenied do |exception|
    @error_message = exception.message
    respond_to do |f|
      f.js{render 'layouts/error', status: 401}
      f.html{flash[:error] = exception.message; redirect_to root_path}
    end
  end
end
