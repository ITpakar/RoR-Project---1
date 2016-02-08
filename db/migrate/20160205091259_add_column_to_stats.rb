class AddColumnToStats < ActiveRecord::Migration
  def change
    add_column :stats, :over_partial, :integer
  end
end
