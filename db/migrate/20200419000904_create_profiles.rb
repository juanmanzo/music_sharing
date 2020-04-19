class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :album
      t.text :comments
      t.string :firstsong
      t.string :secondsong
      t.string :thirdsong
      t.timestamps
      
    end
  end
end
