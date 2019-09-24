class Truck < ApplicationRecord
    belongs_to :user 
    has_many :users, through: :orders
    geocoded_by :display_location
    reverse_geocoded_by :latitude, :longitude
    after_validation :geocode, :reverse_geocode

end
