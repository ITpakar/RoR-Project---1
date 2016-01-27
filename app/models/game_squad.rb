class GameSquad < ActiveRecord::Base
  belongs_to :game
  belongs_to :squad
  belongs_to :player
end
