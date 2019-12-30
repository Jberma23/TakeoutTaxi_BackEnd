class User < ApplicationRecord

  enum role: [:customer, :owner, :admin]
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackables

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 has_many :trucks, :foreign_key => "owner_id"
 has_many :ratings, :foreign_key => "rater_id"
 has_many :orders, :dependent => :destroy, :foreign_key => "purchaser_id"
 has_many :reviews, :foreign_key => "reviewer_id"
 has_many :favorites, :foreign_key => "favoriter_id"
 has_many :locations
 has_many :items, through: :orders
  





  def self.valid_login?(email, password)
    user = where(email: email).first
    [user&.valid_password?(password), user]
  end
     

  # def jwt_payload
  #   { 'User' => @user.id}
  # end
  # def on_jwt_dispatch(token, payload)
  #   do_something(token, payload)
  # end






  
end
