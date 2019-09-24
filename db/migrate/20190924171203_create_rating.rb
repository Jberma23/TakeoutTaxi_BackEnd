class CreateRating < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :truck_id
      t.integer :rating
    end
  end
end
