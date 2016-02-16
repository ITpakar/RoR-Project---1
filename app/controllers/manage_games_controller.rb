class ManageGamesController < ApplicationController
	def index
	end

	def load_squads
		@game = Game.find_by_id(params[:team][:game_id])
	end

end
