class Umpire < ActiveRecord::Base
	belongs_to :country

	validates :scorecard_name, :country, :presence => true
end
