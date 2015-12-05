class SquadPlayer < ActiveRecord::Base
  belongs_to :player
  belongs_to :squad
end
