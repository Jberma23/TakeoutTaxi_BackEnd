class Truck < ApplicationRecord
    belongs_to :user 
    has_many :users, through: :orders
    has_many :ratings, class_name: "Rating", :foreign_key => "rated_id"
    has_many :reviews, class_name: "Review", :foreign_key => "reviewed_id"
    has_many :favorites, class_name: "Favorite", :foreign_key => "favorited_id"
    has_many :orders, class_name: "Order", :foreign_key => "purchased_id"
 



    # geocoded_by :address
    # reverse_geocoded_by :latitude, :longitude
    # after_validation :geocode, :reverse_geocode

end
