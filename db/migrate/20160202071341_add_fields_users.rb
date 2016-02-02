class AddFieldsUsers < ActiveRecord::Migration
  def change
	add_column :users, :role, :string, default: 'user'
	add_column :profiles, :phone_number, :string
  end
end
