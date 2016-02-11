class HomeController < ApplicationController
	# before_action :authenticate_user!, :if => proc {|c| current_usr and current_usr.is_admin?}
	# before_action :authenticate_admin!, :if => proc {|c| !(current_usr and current_usr.is_admin?)}
	before_action :authenticate_scope

	def index
		redirect_to admin_root if current_usr.respond_to? :current_usr and current_usr.is_admin?
	end

end
