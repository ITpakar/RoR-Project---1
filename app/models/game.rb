class Game < ActiveRecord::Base
  belongs_to :squad_1, :class_name => "Squad", :foreign_key => "squad_1_id"
  belongs_to :squad_2, :class_name => "Squad", :foreign_key => "squad_2_id"
  belongs_to :location
  belongs_to :code
  
  has_many :game_team_1_squads, :class_name => "GameSquad"
  has_many :game_team_2_squads, :class_name => "GameSquad"
  
  has_many :game_squads
  
  has_many :innings
  has_many :stats, through: :innings
  
  has_many :teams
    
  #has_many :team_1_players, through: :game_team_1_squads, :class_name => "Player", :foreign_key => "player_id"
  #has_many :team_2_players, through: :game_team_2_squads, :class_name => "Player", :foreign_key => "player_id"
  
  #enum coin_toss_win: {TeamA: 0, TeamB: 1}
  enum coin_toss_decision: {Bat: 0,  Bowled: 1}
  #enum game_winner: {Draw: 0, Team1: 1, Team2: 2}
  enum game_winner_amount: {Draw: 0, Runs: 1, Wickets: 2}
  enum day_night_game: {DayGame: 0, NightGame: 1, DayNightGame: 2}

  accepts_nested_attributes_for :game_team_1_squads
  accepts_nested_attributes_for :game_team_2_squads
  accepts_nested_attributes_for :innings
  accepts_nested_attributes_for :stats
  
  
  before_create :setup_innings
  after_create :setup_squad_stats

  def setup_squad_stats
    squad_members = self.game_squads
    
    self.innings.each do |inning|
      self.game_squads.each do |game_player|        
        Stat.create(inning: inning, player: game_player.player)
      end
    end
    
  end
  
  def selected_palyers
    self.game_squads.includes(:player).references(:player).pluck(:name,:id)   
  end

  def setup_innings
    self.number_of_innings.to_i.times { self.innings.build }
  end
  def find_players team_id
     teams = @game.teams.pluck(:id)
  end

  def get_teams
    [[self.squad_1.country.name,self.squad_1.country.id],[self.squad_2.country.name,self.squad_2.country.id]]
  end

  def get_winner_team
    [["Draw",0],[self.squad_1.country.name,self.squad_1.country.id],[self.squad_2.country.name,self.squad_2.country.id]] 
  end
  
  def full_name
    d = (self.match_date.nil? ? "Date Unknown" : self.match_date.strftime("%d/%m/%y") )
    if self.location.nil? then 
      location = "Location Unknown"
    else
      location = self.location.name
    end
    "#{self.name} - #{self.squad_1.country.name} vs. #{self.squad_2.country.name} - #{self.code.name} - #{d} - #{location}"
  end

  def get_winner_description
    if self.game_winner == 0
      return "Draw"
    else
      winner = Country.find_by_id(self.game_winner)
      "#{winner.name} won by #{self.game_winner_margin} #{self.game_winner_amount}"  
    end 
  end

  def get_umpires
    umpire_1 = Umpire.find_by_id(self.umpire_1)
    umpire_2 = Umpire.find_by_id(self.umpire_2)
      if (umpire_1 and umpire_2)
        "#{umpire_1.name} and #{umpire_2.name}"
      elsif (umpire_1 or umpire_2)
        return umpire_1 ? "#{umpire_1.name}" : "#{umpire_2.name}"
      end
  end
  def get_umpire_tv
    Umpire.find_by_id(self.umpire_tv).try(:name)
  end

  def get_reserve_umpire
    Umpire.find_by_id(self.umpire_reserve).try(:name)
  end

  def get_match_referee
    Umpire.find_by_id(self.umpire_referee).try(:name)
  end

  def coin_toss_outcome
    country = Country.find_by_id(self.coin_toss_win).try(:name)
    if country 
      "#{country.to_s.titleize} won the toss and chose to #{self.coin_toss_decision.to_s.titleize} first" 
    end  
  end


end


