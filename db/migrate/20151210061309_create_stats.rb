class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.belongs_to :inning, index: true, foreign_key: true
      
      t.belongs_to :player, index: true, foreign_key: true
      t.integer :runs, :default => 0
      t.integer :minutes, :default => 0
      t.integer :balls, :default => 0
      t.integer :fours, :default => 0
      t.integer :sixes, :default => 0
      
      t.boolean :run_out, :default => false
      t.integer :bowled_by
      t.integer :caught_by
      
      t.integer :overs, :default => 0
      t.integer :maidens, :default => 0
      t.integer :runs_against, :default => 0
            
      t.timestamps null: false
    end
  end
end
