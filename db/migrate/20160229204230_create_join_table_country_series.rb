class CreateJoinTableCountrySeries < ActiveRecord::Migration
  def change
    create_join_table :countries, :series do |t|
      t.index [:country_id, :series_id], unique: true
    end
  end
end
