class Location < ActiveRecord::Base
  belongs_to :country

  def full_name
    if !self.city.blank?
      "#{self.country.name} - #{self.city} - #{self.name}"
    else
      "#{self.country.name} - #{self.name}"  
    end
  end
end
