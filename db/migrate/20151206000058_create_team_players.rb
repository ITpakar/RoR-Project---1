class CreateTeamPlayers < ActiveRecord::Migration
  def change
    create_table :team_players do |t|
      t.belongs_to :team, index: true, foreign_key: true
      t.belongs_to :player
      t.boolean :captain
      t.boolean :deleted, :default => false
      t.timestamps null: false
    end
  end
end
