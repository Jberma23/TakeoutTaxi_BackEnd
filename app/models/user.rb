class User < ApplicationRecord
  enum role: [:customer, :owner, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trucks
  has_many :orders
  has_many :orders, through: :trucks
  has_many :trucks, through: :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         after_initialize do
          if self.new_record?
            self.role ||= :standard
          end
        end
end
