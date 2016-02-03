class Profile < ActiveRecord::Base
	validates :firstname, :lastname, :screenname, :address, :phone_number, :presence => true
	belongs_to :user
end