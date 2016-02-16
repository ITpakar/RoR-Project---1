module ApplicationHelper
	def full_title(page_title)
		base_title= "Game Tipping"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def admin_root
		new_game_path
	end

	def dashboard_root
		if current_usr
			current_usr.is_admin? ? admin_root : root_path
		else
			root_path
		end
	end

	def manage_usr action
		action == 'edit' ? manage_user_path : manage_users_path
	end

	def current_usr
		return current_user if current_user
		return current_admin if current_admin
		nil
	end

	def signed_in? opt=nil
		!!current_usr
	end

	def destroy_session
		current_usr.is_admin? ? destroy_admin_session_path : destroy_user_session_path
	end

	def current_ability
		if signed_in?
			@current_ability ||= Ability.new(current_usr)
		end
	end

end
