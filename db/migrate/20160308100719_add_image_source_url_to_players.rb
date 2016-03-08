class AddImageSourceUrlToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :image_source_url, :string
  end
end
