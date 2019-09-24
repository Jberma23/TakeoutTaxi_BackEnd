class User < ApplicationRecord

  enum role: [:customer, :owner, :admin]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trucks
  has_many :orders
  has_many :orders, through: :trucks
  has_many :trucks, through: :orders








  
end
