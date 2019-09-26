class Favorite < ApplicationRecord
    # attr_accessor :favorited_id
    belongs_to :favoriter, class_name: "User", :foreign_key => "favoriter_id"
    belongs_to :favorited, class_name: "Truck", :foreign_key => "favorited_id"
end
