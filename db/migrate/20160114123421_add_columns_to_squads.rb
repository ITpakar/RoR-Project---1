class AddColumnsToSquads < ActiveRecord::Migration
  def change
    add_column :squads, :description, :string
  end
end
