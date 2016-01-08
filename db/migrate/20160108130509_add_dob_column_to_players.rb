class AddDobColumnToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :dob, :string
  end
end
