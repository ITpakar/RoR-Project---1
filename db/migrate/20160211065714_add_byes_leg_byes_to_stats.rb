class AddByesLegByesToStats < ActiveRecord::Migration
  def change
    add_column :stats, :byes, :integer ,:default => 0
    add_column :stats, :leg_byes, :integer,:default => 0
  end
end
