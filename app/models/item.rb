class Item < ApplicationRecord
    belongs_to :category
    has_and_belongs_to_many :orders,:join_table => "order_items"
end