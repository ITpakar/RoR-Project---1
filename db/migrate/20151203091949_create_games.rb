class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :match_date
      t.string :name
      t.belongs_to :location
      t.belongs_to :code
      t.integer :squad_1_id, index: true
      t.integer :squad_2_id, index: true
      t.boolean :deleted, :default => false
      t.timestamps null: false
    end
  end
end
