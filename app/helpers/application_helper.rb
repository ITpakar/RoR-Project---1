module ApplicationHelper

	def admin_root
		new_game_path
	end

	def dashboard_root
		if current_user
			current_user.admin? ? admin_root : root_path
		else
			root_path
		end
	end

end
