class Country < ActiveRecord::Base
	has_many :players
	has_and_belongs_to_many :codes
end
