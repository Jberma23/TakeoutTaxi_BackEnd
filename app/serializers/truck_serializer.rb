class TruckSerializer < ActiveModel::Serializer
    has_many :reviews
    has_many :ratings
    has_many :favorites
    attributes :name, :user_id, :image_url, :url, :review_count, :rating, :latitude, :longitude, :price, :address

end