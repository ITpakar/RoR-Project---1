class Stat < ActiveRecord::Base
  belongs_to :inning
  belongs_to :player
end
