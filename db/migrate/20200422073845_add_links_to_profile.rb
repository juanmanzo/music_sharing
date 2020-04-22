class AddLinksToProfile < ActiveRecord::Migration[5.0]
  def change
     add_column :profiles, :url, :string
     add_column :profiles, :artist, :string
     add_column :profiles, :year, :string
  end
end
