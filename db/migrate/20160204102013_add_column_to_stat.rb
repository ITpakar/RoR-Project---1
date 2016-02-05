class AddColumnToStat < ActiveRecord::Migration
  def change
    add_column :stats, :lbw_by, :integer
  end
end
