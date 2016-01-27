class ChangeReferenceFromGameSquads < ActiveRecord::Migration
  def change
    remove_reference :game_squads, :country, index: true, foreign_key: true
    add_reference :game_squads, :squad, index: true, foreign_key: true
  end
end
