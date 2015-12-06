class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.string :name
      t.boolean :deleted, :default => false
      t.timestamps null: false
    end
  end
end
