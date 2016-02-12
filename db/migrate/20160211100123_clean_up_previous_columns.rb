class CleanUpPreviousColumns < ActiveRecord::Migration
  def change
  	remove_column :users, :role
  	remove_column :profiles, :user_id
  	add_column :profiles, :profilable_id, :integer 
  	add_column :profiles, :profilable_type, :string 
  end
end