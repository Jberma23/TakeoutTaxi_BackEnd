class Order < ApplicationRecord
    attr_accessor :purchased_id
    belongs_to :user
    belongs_to :truck
end


