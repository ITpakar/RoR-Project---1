class AddColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :full_name, :string
    add_column :players, :scorecard_name, :string
  end
end
