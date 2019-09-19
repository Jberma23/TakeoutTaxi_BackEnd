class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :trucks
  has_many :orders, through: :trucks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
