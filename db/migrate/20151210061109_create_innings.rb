class CreateInnings < ActiveRecord::Migration
  def change
    create_table :innings do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.integer :batting, :default => 0
      t.integer :bowling, :default => 0
      t.timestamps null: false
    end
  end
end
