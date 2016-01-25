module GamesHelper

	def change_date game
		if  game.id.present?
			game.match_date.to_date.strftime("%d/%m/%Y")
		else
		        
		end       
	end

	def change_player_date player
		if  player.id.present?
			player.match_date.to_date.strftime("%d/%m/%Y")
		else
		        
		end    
     
	end
end
