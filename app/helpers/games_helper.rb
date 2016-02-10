module GamesHelper

	def change_date game
		if  game.id.present?
			game.match_date.to_date.strftime("%d/%m/%Y")
		else
			
		end
	end

	def get_extras stats_opponent
		nb = 0
		wides = 0
		stats_opponent.each do |stat|
          nb = nb + stat.no_balls
          wides = wides + stat.wides
		end
		"nb : #{nb},wides : #{wides}" 
	end

	def get_score stats_current,stats_opponent
		
        total_runs = 0
        wickets = 0
        total_balls = 0
		stats_current.each do |stat|
			total_runs = total_runs + stat.runs
			total_balls = total_balls + stat.balls.to_i
			

			if !stat.fow_order.nil?
			  wickets = wickets+1
			end
			
		end
		overs = "#{total_balls/6}.#{total_balls%6}"

		"#{wickets}/#{total_runs} (#{overs} overs)"
	end

	def run_out_by stat
        if stat.run_out        
        run_out_by = RunOut.where(:innings=>stat.inning_id,:game_id=>@game.id,:player_id=>stat.player_id).pluck(:run_out_by)
        run_out_player = Player.where(:id=>run_out_by).pluck(:name).join(",")
        end
	end

	def get_selected_runout stat
	    if stat.run_out
			run_out_by = RunOut.where(:innings=>stat.inning_id,:game_id=>@game.id,:player_id=>stat.player_id).pluck(:run_out_by)
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

	def calculate_economy_rate stat
		balls = (6*stat.overs.to_i) + stat.over_partial.to_i
		if (balls == 0 || stat.runs_against == 0)
			return 0
		else
			(stat.runs_against.to_f/balls.to_f)*100
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
