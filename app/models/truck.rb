class Truck < ApplicationRecord
    belongs_to :user, class_name: "User", :foreign_key => "owner_id"
    has_many :orders, :dependent => :destroy, class_name: "Order", :foreign_key => "seller_id"
    has_many :ratings, class_name: "Rating", :foreign_key => "rated_id"
    has_many :reviews, class_name: "Review", :foreign_key => "reviewed_id"
    has_many :favorites, class_name: "Favorite", :foreign_key => "favorited_id"
    has_many_attached :image
    has_many :locations
    has_many :menus
    has_many :categories, through: :menus
    has_many :items, through: :categories


   
    def featured_image_url
      if self.featured_image.attachment
        self.featured_image.attachment.service_url
      end
    end
    def menu_image_url
      if self.menu_image.attachment
        self.menu_image.attachment.service_url
      end
    end

    # geocoded_by :address
    # reverse_geocoded_by :latitude, :longitude
    # after_validation :geocode, :reverse_geocode

end
