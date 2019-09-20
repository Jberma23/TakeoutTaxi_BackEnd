class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :truck_id
      t.integer :user_id
     
      t.timestamps
    end
  end
end
