class AddColumnsToGames < ActiveRecord::Migration
  def change
  	add_column :games, :coin_toss_win, :integer,:default => 0
    add_column :games, :coin_toss_decision, :integer,:default => 0
    add_column :games, :game_winner, :integer,:default => 0
    add_column :games, :game_winner_amount, :integer,:default => 0
    add_column :games, :game_winner_margin, :integer,:default => 0

    add_column :games, :day_night_game, :integer
    add_column :games, :player_of_the_match, :integer

    add_column :games, :umpire_1, :integer
    add_column :games, :umpire_2, :integer

    add_column :games, :umpire_tv, :integer

    add_column :games, :umpire_referee, :integer
    add_column :games, :umpire_reserve, :integer 
  end
end
