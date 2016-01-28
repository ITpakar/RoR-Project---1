class AddColumnsToGames < ActiveRecord::Migration
  def change
  	add_column :games, :coin_toss_win, :integer
    add_column :games, :coin_toss_decision, :integer
    add_column :games, :game_winner, :integer
    add_column :games, :game_winner_amount, :integer
    add_column :games, :game_winner_margin, :integer

    add_column :games, :day_night_game, :integer
    add_column :games, :player_of_the_match, :integer

    add_column :games, :umpire_1, :integer
    add_column :games, :umpire_2, :integer

    add_column :games, :umpire_tv, :integer

    add_column :games, :umpire_referee, :integer
    add_column :games, :umpire_reserve, :integer 
  end
end
