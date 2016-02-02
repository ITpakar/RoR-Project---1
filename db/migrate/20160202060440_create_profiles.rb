class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :firstname
      t.string :lastname
      t.string :screenname
      t.string :address
      t.string :fb_link
      t.string :twitter_link

      t.timestamps null: false
    end
  end
end
