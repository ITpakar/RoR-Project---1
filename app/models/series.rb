class Series < ActiveRecord::Base
  has_and_belongs_to_many :countries
  has_many :games

  scope :stored, -> { where(deleted: false) }
  scope :deleted, -> { where(deleted: true) }
end
