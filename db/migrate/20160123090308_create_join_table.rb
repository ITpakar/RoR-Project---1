class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :countries, :codes do |t|
      t.index [:country_id, :code_id]
      t.index [:code_id, :country_id]
    end
  end
end
