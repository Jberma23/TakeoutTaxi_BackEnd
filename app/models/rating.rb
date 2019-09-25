class Rating < ApplicationRecord
    attr_accessor :rated_id
    belongs_to :rater, class_name: "User"
    belongs_to :rated, class_name: "Truck"
end
