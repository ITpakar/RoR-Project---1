class SessionsController < ApplicationController

	def new 
	end

	def create
		@user = User.find_by(:email=>params[:email])
		if @user
			if @user.password == params[:password]
				session[:user_id] = @user.id
				redirect_to new_game_path
			else			 
			  	redirect_to new_session_path
			  	flash[:notice] ="Invalid User"
			end
		else
			redirect_to new_session_path
			flash[:notice] ="Invalid User"
		end	
	end

	def logout
		session[:user_id] = nil
		redirect_to new_session_path
	end
end
