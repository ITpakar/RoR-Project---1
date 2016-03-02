class AddColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :series_id, :integer
    add_index  :games, :series_id
  end
end
