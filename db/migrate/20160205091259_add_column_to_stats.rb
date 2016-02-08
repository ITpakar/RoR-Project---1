class AddColumnToStats < ActiveRecord::Migration
  def change
    add_column :stats, :over_partial, :integer,:default => 0
  end
end
