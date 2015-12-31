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
	end  	

	#---Batting Bonuses

	#Runs * (rounddown(Runs/50))/10)  	







  end
end
