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
    total_batting_points = base_points + (base_points * ((self.runs / 50).floor) * 0.1)   

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
    
    
    
    
    inning_score = total_batting_points + total_bowling_points + catch_points
    puts "$$$"
    puts "#{self.player_id} : #{self.runs} : #{self.balls} : #{total_batting_points} + #{total_bowling_points} + #{catch_points}"
    puts "$$$"
    inning_score 
  end
end