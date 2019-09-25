class ChangeRatinginRatingsToScore < ActiveRecord::Migration[5.2]
  def change
    rename_column :ratings, :rating, :score
  end
end
