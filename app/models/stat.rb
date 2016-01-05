class Stat < ActiveRecord::Base
  belongs_to :inning
  belongs_to :player

  def inning_score

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
    
    if (self.bowlled_by==nil and self.stumped_by==0 and self.caught_by==nil and self.run_out==false)  #if not out
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

        
    
    inning_score = total_batting_points + total_bowling_points + total_fielding_points



    puts "$$$"
    puts "#{self.player_id} : #{self.runs} : #{self.balls} : #{total_batting_points} + #{total_bowling_points} + #{catch_points}"
    puts "$$$"
    inning_score 
  end
end