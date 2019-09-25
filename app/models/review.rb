class Review < ApplicationRecord
    # attr_accessor :user
    belongs_to :reviewer, class_name: "User", :foreign_key => "reviewer_id"
    belongs_to :reviewed, class_name: "Truck", :foreign_key => "reviewed_id"
end
