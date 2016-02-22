class AddWidesToInnings < ActiveRecord::Migration
  def change
    add_column :innings, :squad_1_byes, :integer, :default => 0
    add_column :innings, :squad_1_leg_byes, :integer, :default => 0
    add_column :innings, :squad_2_byes, :integer, :default => 0
    add_column :innings, :squad_2_leg_byes, :integer, :default => 0
  end
end
