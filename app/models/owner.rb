class Owner < ApplicationRecord
    has_many :trucks
    has_many :orders, through: :trucks
end
