class ChangeUserIdToPurchaserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :user_id, :purchaser_id
    rename_column :orders, :truck_id, :seller_id
  end
end
