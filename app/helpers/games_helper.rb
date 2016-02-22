module GamesHelper

	def change_date game
		if  game.id.present?
			game.match_date.to_date.strftime("%d/%m/%Y")
		else
			
		end
	end

	def stats_current_sorted stats,team_id
		stats = stats.reject{ |sp| sp.player.country_id != team_id}
		stats_with_batting_order = stats.reject{|st| (st.batting_order.nil? or st.minutes == 0 or st.balls == 0) }.sort{|a,b| a[:batting_order] && b[:batting_order] ? a[:batting_order] <=> b[:batting_order] : a[:batting_order] ? -1 : 1 }
	end

	def stats_opponent_sorted stats,team_id
		stats = stats.reject{ |sp| sp.player.country_id == team_id}
		stats_with_bowling_order = stats.reject{|st| st.bowling_order == nil}.sort_by{|st| st[:bowling_order]}
	end

	def get_extras stats_opponent,stats_current
		nb = 0
		wides = 0
		leg_byes = 0
		byes = 0

		stats_current.each do |stat|
			leg_byes = leg_byes + stat.leg_byes
		end
		stats_current.each do |stat|
			byes = byes + stat.byes
		end
		stats_opponent.each do |stat|
			nb = nb + stat.no_balls
			wides = wides + stat.wides
		end
		"b : #{byes}, lb : #{leg_byes}, nb : #{nb}, w : #{wides}" 
	end

	def get_score stats_current,stats_opponent
		total_runs = wickets = total_balls = 0
		stats_current.each do |stat|
			total_runs = total_runs + stat.runs + stat.byes + stat.leg_byes
			total_balls = total_balls + stat.balls.to_i
			if !stat.fow_order.nil?
				wickets = wickets+1
			end
		end

		stats_opponent.each do |stat|
			total_runs = total_runs + stat.no_balls + stat.wides 
		end

		overs = "#{total_balls/6}.#{total_balls%6}"
		"#{wickets}/#{total_runs} (#{overs} overs)"
	end

	def fall_of_wickets stats_current
		str = ""
		stats_current = stats_current.reject{|st| st.fow_order==nil}.sort_by{|st| st[:fow_order]}

		stats_current.each do |stat|
			str2 = "#{stat.fow_order}-#{stat.fow_score}(#{stat.player.name}, #{stat.fow_overs.to_i}.#{stat.fow_balls} ov), "
			str+= str2
		end
		str.chomp(", ")
	end

	def didnot_bat_players stats,team_id
		stats = stats.reject{ |sp| sp.player.country_id != team_id}
		# stats_with_batting_order = stats.select{|st| st.batting_order == nil}
		# name = stats_with_batting_order.collect{|st| st.player.name}.join(",")
		stats_with_batting_order = stats.select{|st| (!st.batting_order.nil? && st.minutes == 0 && st.balls == 0) }.sort{|a,b| a[:batting_order] && b[:batting_order] ? a[:batting_order] <=> b[:batting_order] : a[:batting_order] ? -1 : 1 }.collect{|st| st.player.name}.join(",")
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
		begin
			return ((stat.runs.to_f/stat.balls.to_f)*100).round(2)
		rescue
			return 0
		end
	end

	def get_player_extra stat
		if ((stat.no_balls != 0) && (stat.wides != 0))
			return "(#{stat.wides}w,#{stat.no_balls}nb)"
		elsif (stat.no_balls != 0)
			return "(#{stat.no_balls}nb)"
		elsif (stat.wides !=0)
			return "(#{stat.wides}w)"
		else 
			return ""	
		end
	end

	def calculate_economy_rate stat
		begin
			return ((stat.runs_against.to_f/((stat.overs.to_f*6) + stat.over_partial.to_f))*6).round(2)
		rescue
			return 0
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
