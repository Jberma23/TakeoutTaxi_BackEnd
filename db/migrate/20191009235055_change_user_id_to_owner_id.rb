class ChangeUserIdToOwnerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :trucks, :user_id, :owner_id
  end
end
