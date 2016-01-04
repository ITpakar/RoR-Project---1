class AddMissingStatFields < ActiveRecord::Migration
  def change
    add_column :stats, :stumped_by, :integer, :after => :caught_by, :default => 0
    add_column :stats, :wickets, :integer, :after => :runs_against, :default => 0
  end
end
