class Customer < ApplicationRecord
    has_many :orders
    has_many :trucks, through: :orders
end
