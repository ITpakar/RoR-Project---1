class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :match_date
      t.string :name
      t.integer :number_of_innings, :default => 2
      t.belongs_to :location
      t.belongs_to :code
      t.integer :squad_1_id, index: true
      t.integer :squad_2_id, index: true
      
      t.integer :wides, :default => 0
      t.integer :no_balls, :default => 0
      t.integer :byes, :default => 0
      t.integer :leg_byes, :default => 0
      t.integer :extras, :default => 0
      t.text :notes
      
      t.boolean :deleted, :default => false
      t.timestamps null: false
    end
  end
end
