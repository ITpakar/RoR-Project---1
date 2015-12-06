class GameSquad < ActiveRecord::Base
  belongs_to :game
  belongs_to :country
  belongs_to :player
end
