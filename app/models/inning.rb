class Inning < ActiveRecord::Base
  belongs_to :game
  has_many :stats
  accepts_nested_attributes_for :stats  
end
