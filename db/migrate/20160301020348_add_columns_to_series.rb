class AddColumnsToSeries < ActiveRecord::Migration
  def change
    add_column :series, :deleted, :boolean, :default => false
  end
end
