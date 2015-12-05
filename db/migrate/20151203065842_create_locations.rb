class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.belongs_to :country, index: true, foreign_key: true
      t.boolean :deleted, :default => false
      t.timestamps null: false
    end
  end
end
