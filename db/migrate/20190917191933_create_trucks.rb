class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string :name
      t.integer :user_id
      t.string :image_url
      t.string :url
      t.integer :review_count
      t.integer :rating
      t.string :latitude
      t.string :longitude
      t.string :price
      t.string :display_location
      t.timestamps
    end
  end
end
