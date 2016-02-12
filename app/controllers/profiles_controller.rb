class ProfilesController < ApplicationController
	before_action :authenticate_scope
	def update
		profile = Profile.find_by_id(params[:id])
		profile.update(profile_params)
		redirect_to edit_user_profile_path(current_usr, profile)
	end

	private
	def profile_params
		params.require(:profile).permit(:firstname, :lastname, :screenname, :address,
			:phone_number, :fb_link, :twitter_link)
	end
end
