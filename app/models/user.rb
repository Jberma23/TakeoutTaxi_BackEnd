class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :trucks
  has_many :orders, through: :trucks
  has_many :orders
  has_many :trucks, through: :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
