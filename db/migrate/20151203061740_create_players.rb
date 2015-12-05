class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.belongs_to :country, index: true, foreign_key: true
      t.integer :batting_style, :default => 0
      t.string :bowling_style
      t.integer :role, :default => 0
      t.boolean :deleted, :default => false
      t.timestamps null: false
    end
  end
end
