class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :username
      t.string :password
      t.date :date_Of_Birth

      t.timestamps
    end
  end
end
