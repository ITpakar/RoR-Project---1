class Profile < ActiveRecord::Base
	validates :firstname, :lastname, :screenname, :address, :phone_number, :presence => true
	validates_uniqueness_of :screenname
	# validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
	# belongs_to :user
	belongs_to :profilable, :polymorphic => true
end