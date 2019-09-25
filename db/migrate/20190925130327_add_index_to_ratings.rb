class AddIndexToRatings < ActiveRecord::Migration[5.2]
  def change
    add_index :ratings, :rater_id
    add_index :ratings, :rated_id
  end
end
