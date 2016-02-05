class Profile < ActiveRecord::Base
	validates :firstname, :lastname, :screenname, :address, :phone_number, :presence => true
	validates_uniqueness_of :screenname
	belongs_to :user
end