class Order < ApplicationRecord
    attr_accessor :purchased_id
    belongs_to :purchaser, class_name: "User"
    belongs_to :purchased, class_name: "Truck"
end


