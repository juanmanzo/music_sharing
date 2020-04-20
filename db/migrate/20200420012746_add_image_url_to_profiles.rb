class AddImageUrlToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :imageurl, :string
  end
end
