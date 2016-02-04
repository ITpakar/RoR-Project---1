class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
		redirect_to admin_root if current_user.admin?
	end
end
