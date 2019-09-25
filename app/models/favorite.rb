class Favorite < ApplicationRecord
    attr_accessor :favorited_id
    belongs_to :favoriter, class_name: "User"
    belongs_to :favorited, class_name: "Truck"
end
