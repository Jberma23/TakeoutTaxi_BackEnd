class Truck < ApplicationRecord
    belongs_to :user 
    has_many :users, through: :orders
    has_many :ratings, :foreign_key => "rated_id"
    has_many :reviews, :foreign_key => "reviewed_id"
    has_many :favorites, :foreign_key => "favorited_id"
    has_many :orders, :foreign_key => "purchased_id"
 



    geocoded_by :address
    reverse_geocoded_by :latitude, :longitude
    after_validation :geocode, :reverse_geocode

end
