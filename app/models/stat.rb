class Stat < ActiveRecord::Base
  belongs_to :inning
  belongs_to :player


  def inning_score

    points = 0
  	#---Base Batting Score

  	if    self.runs = 0 and self.balls > 1 #Duck
        points = -10

    elsif self.runs=0 and self.balls=1 #Golden Duck
        points = -20 

    else   
	  	points = self.runs #each run

	  	points = points + self.fours #each four

	  	points = points + (self.sixes*2) #each sixes

      base_points = points
	  end  	

	  #---Batting Bonuses
    if   self.runs.in?(50..99)
     
      points = base_points + (base_points*0.1).round
    
    elsif  self.runs.in?(100..149)
      points = base_points + (base_points*0.2).round
    end   

      total_batting_points = points + base_points*0.1 if self.run_out


    #---Bowling Points

    wicket_points = 25*self.wickets

    extras = self.runs_against*(-1)

    base_bowling_points = wicket_points+extras


    #---Bowling Bonuses

    #total_bowling_points = base_bowling_points + (base_bowling_points*0.1).rounds if self.wickets

    #---Fielding Points

    catch_points = self.catch*10

    










  end
end



