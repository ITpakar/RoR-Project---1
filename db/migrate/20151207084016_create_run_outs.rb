class CreateRunOuts < ActiveRecord::Migration
  def change
    create_table :run_outs do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.integer :innings
      t.belongs_to :player, index: true, foreign_key: true
      t.integer :run_out_by

      t.timestamps null: false
    end
  end
end
