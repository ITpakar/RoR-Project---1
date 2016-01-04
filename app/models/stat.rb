class Stat < ActiveRecord::Base
  belongs_to :inning
  belongs_to :player

  def inning_score

    points = 0
    base_points = 0
  	#---Base Batting Score
  	if self.runs = 0 and self.balls > 1 #Duck
      points = -10
    elsif self.runs = 0 and self.balls = 1 #Golden Duck
      points = -20 
    else   
      points = self.runs + self.fours + (self.sixes * 2)
      base_points = points
	  end  	

	  #---Batting Bonuses    
    total_batting_points = base_points + (base_points * ((self.runs / 50).floor) * 0.1)   

    #---Bowling Points
    wicket_points = 25 * self.wickets
    extras = self.runs_against * (-1)
    base_bowling_points = wicket_points + extras

    #---Bowling Bonuses
    #total_bowling_points = base_bowling_points + (base_bowling_points*0.1).rounds if self.wickets
    
    #---Fielding Points    
    catch_points = Stat.where(inning_id: self.inning_id, caught_by: self.player_id).count * 10
    
  end
end