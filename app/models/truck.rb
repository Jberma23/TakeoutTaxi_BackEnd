class Truck < ApplicationRecord
    belongs_to :owner 
    has_many :customers, through: :orders
end
