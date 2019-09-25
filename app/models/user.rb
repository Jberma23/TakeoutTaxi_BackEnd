class User < ApplicationRecord

  enum role: [:customer, :owner, :admin]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :trucks
 
 has_many :ratings, :foreign_key => "rater_id"
 has_many :orders
 has_many :trucks, through: :orders 
 has_many :reviews, :foreign_key => "reviewer_id"
 has_many :favorites, :foreign_key => "favoriter_id"

  





  








  
end
