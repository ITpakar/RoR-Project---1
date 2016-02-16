class Umpire < ActiveRecord::Base
	belongs_to :country
	validates :scorecard_name, :country, :presence => true
	default_scope -> {where(deleted: 0)}
end
