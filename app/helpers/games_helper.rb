module GamesHelper

	def change_date game
		if  game.id.present?
			game.match_date.to_date.strftime("%d/%m/%Y")
		else
		        
		end       
	end

	def find_opponent_player stats_opponent
		arr = [["Please Select",""]]
		stats_opponent.each do |so|
          arr << [so.player.name,so.player.id]
		end
		arr
	end
    
    def find_player id
    	Player.find_by_id(id).try(:name)
    end
    
    def calculate_stricke_rate stat
    	if stat.balls or stat.runs then
    		return 0
    	else 
    	    (stat.runs.to_f/stat.balls.to_f)*100	
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

	def get_toss_winner game		
       
       game.coin_toss_win
	end

end
