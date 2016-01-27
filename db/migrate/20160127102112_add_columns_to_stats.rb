class AddColumnsToStats < ActiveRecord::Migration
  def change
    add_column :stats, :batting_order, :integer
    add_column :stats, :bowling_order, :integer
    add_column :stats, :fow_order, :integer
    add_column :stats, :fow_score, :integer
    add_column :stats, :fow_overs, :float
    add_column :stats, :fow_balls, :integer
  end
end
