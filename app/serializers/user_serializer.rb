class UserSerializer  < ActiveModel::Serializer
  has_many :ratings, :foreign_key => "rater_id"
  has_many :orders
  has_many :trucks, through: :orders 
  has_many :reviews, :foreign_key => "reviewer_id"
  has_many :favorites, :foreign_key => "favoriter_id"
  attributes :id, :firstName, :lastName, :username, :role, :email, :ratings, :orders, :trucks, :reviews, :favorites
end
