class ChangingUserAndTruckToFixRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :user_id, :reviewer_id
    rename_column :reviews, :truck_id, :reviewed_id
  
    rename_column :favorites, :user_id, :favoriter_id
    rename_column :favorites, :truck_id, :favorited_id
  
 
    add_index :reviews, :reviewer_id
    add_index :reviews, :reviewed_id
    add_index :favorites, :favoriter_id
    add_index :favorites, :favorited_id
  end
end
