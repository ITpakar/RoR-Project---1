class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :player, index: true, foreign_key: true
      t.integer :runs
      t.integer :minutes
      t.integer :balls
      t.integer :4s
      t.integer :6s
      t.integer :overs
      t.integer :maidens
      t.integer :runs_against
      t.integer :wickets
      t.integer :extras
      t.integer :catches
      t.integer :stumpings
      t.integer :run_outs

      t.timestamps null: false
    end
  end
end
