class CreateUmpires < ActiveRecord::Migration
  def change
    create_table :umpires do |t|
      t.string :name
      t.string :country
      t.boolean :deleted, :default => false

      t.timestamps null: false
    end
  end
end
