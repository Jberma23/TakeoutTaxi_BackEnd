class Menu < ApplicationRecord
    belongs_to :truck
    has_many :categories
    has_many :items, through: :categories
end