class AddMoreMissingStatFields < ActiveRecord::Migration
  def change
    add_column :stats, :wides, :integer, :after => :wickets, :default => 0
    add_column :stats, :no_balls, :integer, :after => :wides, :default => 0
    
    add_column :stats, :zeroes_against, :integer, :after => :no_balls, :default => 0
    add_column :stats, :fours_against, :integer, :after => :zeroes_against, :default => 0
    add_column :stats, :sixes_against, :integer, :after => :fours_against, :default => 0
  end
end
