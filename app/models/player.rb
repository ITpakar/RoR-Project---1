class Player < ActiveRecord::Base
  belongs_to :country
  mount_uploader :image, ImageUploader
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :team_players
  
  #enum role: {Batsman: 0, Bowler: 1, AllRounder: 2, WicketKeeper: 3}
  enum batting_style: {RightHander: 0, LeftHander: 1}
  
  validates :name, :presence => true
  validates :country, :presence => true
  # validates :role, :presence => true
  validates :batting_style, :presence => true
  # validates :bowling_style, :presence => true

end
