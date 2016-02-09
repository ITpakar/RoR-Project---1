class AddColumnToUmpires < ActiveRecord::Migration
  def change
    add_column :umpires, :full_name, :string
    add_column :umpires, :scorecard_name, :string
    add_column :umpires, :dob, :date
    add_column :umpires, :date_died, :date        
  end
end
