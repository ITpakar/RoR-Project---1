class AddWidesToInnings < ActiveRecord::Migration
  def change
    add_column :innings, :byes, :integer, :default => 0
    add_column :innings, :leg_byes, :integer, :default => 0
  end
end
