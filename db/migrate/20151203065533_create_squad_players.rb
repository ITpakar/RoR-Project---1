class CreateSquadPlayers < ActiveRecord::Migration
  def change
    create_table :squad_players do |t|
      t.belongs_to :player, index: true, foreign_key: true
      t.belongs_to :squad, index: true, foreign_key: true
      t.boolean :captain, :default => false
      t.timestamps null: false
    end
  end
end
