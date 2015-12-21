class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :name
      t.integer :default_innings, :default => 2
      t.boolean :deleted, :default => false
      t.timestamps null: false
    end
  end
end
