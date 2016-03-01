class AddTwoColumnToStats < ActiveRecord::Migration
  def change
    add_column :stats, :hit_wicket, :boolean, :after => :run_out, :default => false
    add_column :stats, :retired_hurt, :boolean, :after => :hit_wicket, :default => false
  end
end
