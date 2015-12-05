class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.belongs_to :code, index: true, foreign_key: true
      t.belongs_to :country, index: true, foreign_key: true
      t.boolean :deleted, :default => false
      t.timestamps null: false
    end
  end
end
