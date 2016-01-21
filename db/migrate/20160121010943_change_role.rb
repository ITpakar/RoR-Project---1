class ChangeRole < ActiveRecord::Migration
  def change
    change_column :players, :role, :string
  end
end
