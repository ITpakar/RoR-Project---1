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

	def get_umpire_1 game
       u=  Umpire.find_by_id(game.umpire_1)      
       u.nil? ? nil : u.id
	end
	def get_umpire_2 game
       u = Umpire.find_by_id(game.umpire_2)
       u.nil? ?  nil : u.id 
	end
	def get_umpire_tv game
       u = Umpire.find_by_id(game.umpire_tv)
       u.nil? ? nil : u.id
	end
	def get_umpire_referee game
       u = Umpire.find_by_id(game.umpire_referee)
       u.nil? ? nil : u.id
	end
	def get_umpire_reserve game
       u = Umpire.find_by_id(game.umpire_reserve)
       u.nil? ?  nil : u.id
	end

end
