class CreateGameSquads < ActiveRecord::Migration
  def change
    create_table :game_squads do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :squad, index: true, foreign_key: true
      t.belongs_to :player, index: true, foreign_key: true
      t.boolean :selected, default: false
      t.boolean :captain, default: false
      t.boolean :wicket_keeper, default: false
      t.timestamps null: false
    end
  end
end
