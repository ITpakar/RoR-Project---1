class Squad < ActiveRecord::Base
  belongs_to :country
  belongs_to :code
  
  has_many :squad_players
  has_many :players, through: :squad_players
  
  attr_accessor :available_players, :selected_players, :column_data
  
  def get_available_players
    selected_players = []
    if !self.players.nil? then
      selected_players = self.players.pluck(:name, :id)
    #  #puts selected_fields      
    end
    #Property.attribute_names.reject{|r1| selected_players.include? r1.camelize}.reject{|r| r == "id" || r == "created_at" || r == "created_by_id" || r == "updated_at"}.map.with_index{ |k, index| [k.titleize, "#{k.camelize}"  ]}
    Player.pluck(:name, :id)
  end
end
