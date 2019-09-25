class ChangeUserIdandTruckIdInRatings < ActiveRecord::Migration[5.2]
  def change
    rename_column :ratings, :user_id, :rater_id
    rename_column :ratings, :truck_id, :rated_id
  end
end
