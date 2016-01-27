class AddReferencesToUmpires < ActiveRecord::Migration
  def change
  	remove_column :umpires, :country
    add_reference :umpires, :country, index: true, foreign_key: true
  end
end
