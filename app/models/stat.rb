class Stat < ActiveRecord::Base
  belongs_to :inning
  belongs_to :player


  def inning_score team_id

    points = 0
    base_points = 0
  	#---Base Batting Score
  	if self.runs == 0 and self.balls > 1 #Duck
      points = -10
    elsif self.runs == 0 and self.balls == 1 #Golden Duck
      points = -20 
    else   
      points = self.runs + self.fours + (self.sixes * 2)      
	  end  	
	  base_points = points

	  #---Batting Bonuses    
    total_batting_points = base_points + (base_points * ((self.runs / 50).floor)/10) #Bonus above Score 50   
    
    if (self.bowled_by==nil and self.stumped_by==0 and self.caught_by==nil and self.run_out==false)  #if not out
      total_batting_points = total_batting_points + base_points*0.1  
    end
    #---Bowling Points
    wicket_points = 25 * self.wickets
    extras = self.runs_against * (-1)
    base_bowling_points = wicket_points + extras    
    
    bowling_bonus = 0
    if self.wickets >= 3 then
      bowling_bonus = (base_bowling_points * (self.wickets * 0.1)) 
    end
    
    total_bowling_points = base_bowling_points + bowling_bonus
    
    #---Fielding Points    
    catch_points = Stat.where(inning_id: self.inning_id, caught_by: self.player_id).count * 10
    stump_points = Stat.where(inning_id: self.inning_id, stumped_by: self.player_id).count * 15
    runout_points = RunOut.where(innings: self.inning_id, player_id: self.player_id).count * 25

    total_fielding_points = catch_points + stump_points + runout_points

        
    #---Total Inning score 
    inning_score = total_batting_points + total_bowling_points + total_fielding_points

    #if current player is captain inning score will be double
    if (TeamPlayer.where(team_id: team_id,player_id: self.player_id).first.captain) 
       inning_score = 2*inning_score
    end

    #puts "$$$"
    #puts "#{self.player_id} : #{self.runs} : #{self.balls} : #{total_batting_points} + #{total_bowling_points} + #{catch_points}"
    #puts "$$$"
    inning_score 
  end

  def out_decription game_id
    if self.run_out
       run_out_by = RunOut.where(:innings=>self.inning_id,:game_id=>game_id,:player_id=>self.player_id).pluck(:run_out_by)
       run_out_player = Player.where(:id=>run_out_by).pluck(:name).join(",")
       return "run out (#{run_out_player})"
    elsif !self.lbw_by.nil?
      name = Player.find_by_id(self.lbw_by).name
      return "lbw #{name}"
    elsif !self.stumped_by.nil?
        stump_by = Player.find_by_id(self.stumped_by).name
        bowller =  Player.find_by_id(self.bowled_by).name
        return "st. #{stump_by} , b. #{bowller}"
    elsif !self.caught_by.nil?
      caughter = Player.find_by_id(self.caught_by)
      bowller  = Player.find_by_id(self.bowled_by)
      if caughter==bowller
        return "c & b #{bowller.name}"
      else
        return "c #{caughter.name} b #{bowller.name}"
      end 
    elsif !self.bowled_by.nil?
      bowller  = Player.find_by_id(self.bowled_by).name
        return  "b #{bowller}"
    elsif ((self.fow_order.nil?) && (!self.batting_order.nil?))
        return  "not out"  
    end
  end
end