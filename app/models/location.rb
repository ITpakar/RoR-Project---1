class Location < ActiveRecord::Base
  belongs_to :country

  def full_name
    "#{self.country.name} - #{self.name}"
  end
end
