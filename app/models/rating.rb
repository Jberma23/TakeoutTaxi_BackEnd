class Rating < ApplicationRecord
    # attr_accessor :rated_id
    belongs_to :rater, class_name: "User",  :foreign_key => "rater_id"
    belongs_to :rated, class_name: "Truck", :foreign_key => "rated_id"
end
