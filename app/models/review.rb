class Review < ApplicationRecord
    attr_accessor :reviewed_id
    belongs_to :reviewer, class_name: "User"
    belongs_to :reviewed, class_name: "Truck"
end
