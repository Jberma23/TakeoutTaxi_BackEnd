class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :ingredients
      t.integer :price
      t.integer :category_id
    end
  end
end
