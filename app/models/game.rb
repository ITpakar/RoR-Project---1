class Game < ActiveRecord::Base
  belongs_to :squad_1, :class_name => "Squad", :foreign_key => "squad_1_id"
  belongs_to :squad_2, :class_name => "Squad", :foreign_key => "squad_2_id"
  belongs_to :location
  
  has_many :game_squads
  #has_many :game_squad_players, through: :game_squads
  has_many :players, through: :game_squads
  
  accepts_nested_attributes_for :game_squads
end
