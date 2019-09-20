class Truck < ApplicationRecord
    belongs_to :user 
    has_many :users, through: :orders
end
